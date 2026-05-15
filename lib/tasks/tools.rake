require 'net/http'
require 'json'

namespace :tools do
  desc 'Add a new tool from a GitHub URL (Usage: bin/rails tools:add URL=https://github.com/... [CATEGORY=...])'
  task add: :environment do
    url = ENV['URL']

    unless url.present?
      puts '❌ Error: Please provide a GitHub URL.'
      puts 'Usage: bin/rails tools:add URL=https://github.com/user/repo [CATEGORY=Utility]'
      exit 1
    end

    repo = url.split('github.com/').last&.strip&.gsub(%r{/$}, '')

    unless repo.present?
      puts '❌ Error: Invalid GitHub URL format.'
      exit 1
    end

    puts "🔍 Fetching data for #{repo}..."

    headers = {
      'Accept' => 'application/vnd.github.v3+json',
      'User-Agent' => 'Clier-App'
    }

    token = ENV['GITHUB_TOKEN'] || `gh auth token 2>/dev/null`.strip
    headers['Authorization'] = "Bearer #{token}" if token.present?

    uri = URI("https://api.github.com/repos/#{repo}")
    req = Net::HTTP::Get.new(uri)
    headers.each { |k, v| req[k] = v }

    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end

    unless res.is_a?(Net::HTTPSuccess)
      puts "❌ Error: Could not fetch data from GitHub API (#{res.code} #{res.message})"
      exit 1
    end

    data = JSON.parse(res.body)

    # Determine category
    category = ENV['CATEGORY']
    if category.blank?
      topics = data['topics'] || []

      # Try to find an existing category that matches one of the topics
      existing_categories = Tool.pluck(:category).uniq.compact.map(&:downcase)

      matched_topic = topics.find { |topic| existing_categories.include?(topic.downcase) }

      category = if matched_topic
                   # Find the properly cased version of the category
                   Tool.where('LOWER(category) = ?', matched_topic.downcase).pick(:category)
                 elsif topics.any?
                   # If no match, just use the first topic capitalized
                   topics.first.capitalize
                 else
                   'Uncategorized'
                 end
    end

    tool = Tool.find_or_initialize_by(github_url: "https://github.com/#{repo}")
    tool.name = data['name']
    tool.description = data['description']
    tool.category = category if tool.new_record? || ENV['CATEGORY'].present?
    tool.github_stars = data['stargazers_count']
    tool.website_url = data['homepage'] if data['homepage'].present?
    tool.image_url = "https://opengraph.githubassets.com/1/#{repo}"

    if tool.save
      puts "✅ Successfully #{tool.previously_new_record? ? 'added' : 'updated'} tool: #{tool.name} (Category: #{tool.category})"

      # Run UpdateToolsJob to fetch the README and releases immediately
      puts '🔄 Updating tool details (README, versions) in the background...'
      UpdateToolsJob.perform_later
    else
      puts '❌ Failed to save tool:'
      tool.errors.full_messages.each { |msg| puts "  - #{msg}" }
    end
  end
end
