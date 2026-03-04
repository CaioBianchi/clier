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

  test "should filter by favorites" do
    user = users(:one)
    tool_one = tools(:one)
    tool_one.update!(name: "Tool One")
    tool_two = tools(:two)
    tool_two.update!(name: "Tool Two")

    # Ensure user one only favorites tool one
    Favorite.destroy_all
    Favorite.create!(user: user, tool: tool_one)

    post session_url, params: { email_address: user.email_address, password: "password" }

    get tools_url(favorites: true)
    assert_response :success
    assert_select "h2", text: "Tool One"
    assert_select "h2", text: "Tool Two", count: 0
  end
end
