require "test_helper"
require "webmock/minitest"

class UpdateToolsJobTest < ActiveJob::TestCase
  test "updates tool information from github api" do
    Tool.destroy_all # clear fixtures to test cleanly

    tool = Tool.create!(name: "Test", github_url: "https://github.com/test/repo", github_stars: 0)

    stub_request(:get, "https://api.github.com/repos/test/repo").
      to_return(status: 200, body: { stargazers_count: 100 }.to_json, headers: { "Content-Type" => "application/json" })

    stub_request(:get, "https://api.github.com/repos/test/repo/releases/latest").
      to_return(status: 200, body: { tag_name: "v1.0.0" }.to_json, headers: { "Content-Type" => "application/json" })

    stub_request(:get, "https://api.github.com/repos/test/repo/readme").
      to_return(status: 200, body: "<h1>Test README</h1>", headers: { "Content-Type" => "text/html" })

    UpdateToolsJob.perform_now

    tool.reload
    assert_equal 100, tool.github_stars
    assert_equal "v1.0.0", tool.stable_version
    assert_equal "<h1>Test README</h1>", tool.readme_html
    assert_equal "https://opengraph.githubassets.com/1/test/repo", tool.image_url
  end
end
