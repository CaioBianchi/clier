require 'json'
require 'net/http'

namespace :tools do
  desc 'Add a new tool from a GitHub URL (Usage: bin/rails tools:add URL=https://github.com/... [CATEGORY=...])'
  task add: :environment do
    repo = github_repo_from_env

    puts "🔍 Fetching data for #{repo}..."

    data = fetch_github_repo_data(repo)
    tool = build_tool(repo, data)

    if tool.save
      puts success_message(tool)

      puts '🔄 Updating tool details (README, versions) in the background...'
      UpdateToolsJob.perform_later
    else
      puts '❌ Failed to save tool:'
      tool.errors.full_messages.each { |message| puts "  - #{message}" }
    end
  end

  def github_repo_from_env
    url = ENV.fetch('URL', nil)

    unless url.present?
      abort <<~MESSAGE
        ❌ Error: Please provide a GitHub URL.

        Usage:
          bin/rails tools:add URL=https://github.com/user/repo [CATEGORY=Utility]
      MESSAGE
    end

    repo = url.split('github.com/')
              .last
              &.strip
              &.delete_suffix('/')

    abort '❌ Error: Invalid GitHub URL format.' if repo.blank?

    repo
  end

  def fetch_github_repo_data(repo)
    uri = URI("https://api.github.com/repos/#{repo}")

    request = Net::HTTP::Get.new(uri).tap do |req|
      github_headers.each do |key, value|
        req[key] = value
      end
    end

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    abort "❌ Error: Could not fetch data from GitHub API (#{response.code} #{response.message})" unless response.is_a?(Net::HTTPSuccess)

    JSON.parse(response.body)
  end

  def github_headers
    headers = {
      'Accept' => 'application/vnd.github.v3+json',
      'User-Agent' => 'Clier-App'
    }

    token = github_token
    headers['Authorization'] = "Bearer #{token}" if token.present?

    headers
  end

  def github_token
    ENV['GITHUB_TOKEN'].presence || `gh auth token 2>/dev/null`.strip.presence
  end

  def build_tool(repo, data)
    Tool.find_or_initialize_by(github_url: github_url(repo)).tap do |tool|
      tool.name = data['name']
      tool.description = data['description']
      tool.github_stars = data['stargazers_count']
      tool.image_url = "https://opengraph.githubassets.com/1/#{repo}"

      tool.website_url = data['homepage'] if data['homepage'].present?

      tool.category = resolved_category(data) if tool.new_record? || ENV['CATEGORY'].present?
    end
  end

  def github_url(repo)
    "https://github.com/#{repo}"
  end

  def resolved_category(data)
    explicit_category = ENV.fetch('CATEGORY', nil)
    return explicit_category if explicit_category.present?

    topics = data['topics'] || []
    return 'Uncategorized' if topics.empty?

    existing_categories = Tool.distinct
                              .pluck(:category)
                              .compact

    matched_category = existing_categories.find do |category|
      topics.any? { |topic| topic.casecmp?(category) }
    end

    matched_category || topics.first.capitalize
  end

  def success_message(tool)
    action = tool.previously_new_record? ? 'added' : 'updated'

    "✅ Successfully #{action} tool: #{tool.name} (Category: #{tool.category})"
  end
end
