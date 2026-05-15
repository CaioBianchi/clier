require 'net/http'
require 'uri'

puts 'Starting image download...'

Tool.find_each do |tool|
  next if tool.image.attached?

  repo = tool.github_url&.split('github.com/')&.last
  next unless repo

  image_url = "https://opengraph.githubassets.com/1/#{repo}"

  begin
    uri = URI(image_url)
    res = Net::HTTP.get_response(uri)

    if res.is_a?(Net::HTTPSuccess)
      tool.image.attach(
        io: StringIO.new(res.body),
        filename: "#{repo.parameterize}-opengraph.png",
        content_type: 'image/png'
      )
      puts "✅ Downloaded image for #{tool.name}"
    else
      puts "❌ Failed to download image for #{tool.name} (#{res.code})"
    end
  rescue StandardError => e
    puts "❌ Error fetching image for #{tool.name}: #{e.message}"
  end

  sleep 0.5 # Add a small delay to avoid aggressive rate limiting from GitHub
end

puts 'Done!'
