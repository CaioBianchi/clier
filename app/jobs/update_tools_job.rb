require "net/http"
require "json"

class UpdateToolsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rails.logger.info "Starting UpdateToolsJob..."

    headers = {
      "Accept" => "application/vnd.github.v3+json",
      "User-Agent" => "Clier-App"
    }

    token = ENV["GITHUB_TOKEN"] || `gh auth token 2>/dev/null`.strip
    headers["Authorization"] = "Bearer #{token}" if token.present?

    Tool.find_each do |tool|
      next unless tool.github_url.present?

      repo = tool.github_url.split("github.com/").last
      next unless repo

      # Ensure image URL is set
      tool.image_url = "https://opengraph.githubassets.com/1/#{repo}" if tool.image_url.blank?

      # Fetch repo data for stars
      repo_data = fetch_json("https://api.github.com/repos/#{repo}", headers)
      if repo_data && repo_data["stargazers_count"]
        tool.github_stars = repo_data["stargazers_count"]
      end

      # Fetch latest release for version
      release_data = fetch_json("https://api.github.com/repos/#{repo}/releases/latest", headers)
      if release_data && release_data["tag_name"]
        tool.stable_version = release_data["tag_name"]
      else
        tags_data = fetch_json("https://api.github.com/repos/#{repo}/tags", headers)
        if tags_data.is_a?(Array) && tags_data.any?
          tool.stable_version = tags_data.first["name"]
        end
      end

      # Fetch README
      html_headers = headers.merge("Accept" => "application/vnd.github.html")
      readme_html = fetch_html("https://api.github.com/repos/#{repo}/readme", html_headers)
      if readme_html
        tool.readme_html = readme_html
      end

      if tool.save
        Rails.logger.info "Updated #{tool.name}"
      else
        Rails.logger.error "Failed to update #{tool.name}"
      end
    end

    Rails.logger.info "Finished UpdateToolsJob!"
  end

  private

  def fetch_json(url, headers)
    uri = URI(url)
    req = Net::HTTP::Get.new(uri)
    headers.each { |k, v| req[k] = v }

    begin
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(req)
      end

      if res.is_a?(Net::HTTPSuccess)
        JSON.parse(res.body)
      else
        nil
      end
    rescue => e
      Rails.logger.error "HTTP request failed for #{url}: #{e.message}"
      nil
    end
  end

  def fetch_html(url, headers)
    uri = URI(url)
    req = Net::HTTP::Get.new(uri)
    headers.each { |k, v| req[k] = v }

    begin
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(req)
      end

      if res.is_a?(Net::HTTPSuccess)
        res.body
      else
        nil
      end
    rescue => e
      Rails.logger.error "HTTP request failed for #{url}: #{e.message}"
      nil
    end
  end
end
