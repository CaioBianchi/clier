require "test_helper"

class ToolsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tools_url
    assert_response :success
  end

  test "should filter by category" do
    get tools_url(category: "Utility")
    assert_response :success
  end

  test "should filter by query" do
    get tools_url(query: "search term")
    assert_response :success
  end

  test "should get show" do
    tool = tools(:one)
    stub_request(:get, "https://api.github.com/repos/MyString/readme").
      to_return(status: 200, body: "<h1>Test README</h1>", headers: { "Content-Type" => "text/html" })

    get tool_url(tool)
    assert_response :success
  end
end
