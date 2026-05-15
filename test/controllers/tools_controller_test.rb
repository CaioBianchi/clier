require 'test_helper'

class ToolsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get tools_url
    assert_response :success
    assert_select 'a', text: 'Editor'
    assert_select 'a', text: 'Utility'
  end

  test 'should filter by category' do
    get tools_url(category: 'Utility')
    assert_response :success
    assert_select 'h2', text: 'ripgrep'
    assert_select 'h2', text: 'Neovim', count: 0
  end

  test 'should filter by query' do
    get tools_url(query: 'ripgrep')
    assert_response :success
    assert_select 'h2', text: 'ripgrep'
  end

  test 'should get show' do
    tool = tools(:one)
    stub_request(:get, 'https://api.github.com/repos/neovim/neovim/readme')
      .to_return(status: 200, body: '<h1>Test README</h1>', headers: { 'Content-Type' => 'text/html' })

    get tool_url(tool), headers: { 'Turbo-Frame' => 'modal' }
    assert_response :success
  end

  test 'should filter by favorites' do
    user = users(:one)
    tool_one = tools(:one)
    tool_two = tools(:two)

    # Ensure user one only favorites tool one
    Favorite.destroy_all
    Favorite.create!(user: user, tool: tool_one)

    post session_url, params: { email_address: user.email_address, password: 'password' }

    get tools_url(favorites: true)
    assert_response :success
    assert_select 'h2', text: 'Neovim'
    assert_select 'h2', text: 'ripgrep', count: 0
  end

  test 'should not allow non-admins to delete tools' do
    tool = tools(:one)
    delete tool_url(tool)
    assert_redirected_to tool_url(tool)
    assert_equal 'You are not authorized to delete this tool.', flash[:alert]
  end

  test 'should allow admins to delete tools' do
    admin = users(:one)
    admin.update!(role: :admin)
    sign_in_as(admin)

    tool = tools(:one)
    assert_difference('Tool.count', -1) do
      delete tool_url(tool)
    end
    assert_redirected_to tools_url
    assert_equal 'Tool was successfully deleted.', flash[:notice]
  end

  test 'should not allow non-admins to spotlight tools' do
    tool = tools(:one)
    patch spotlight_tool_url(tool)
    assert_redirected_to tool_url(tool)
    assert_equal 'You are not authorized to perform this action.', flash[:alert]
    assert_not tool.reload.spotlighted?
  end

  test 'should allow admins to spotlight tools' do
    admin = users(:one)
    admin.update!(role: :admin)
    sign_in_as(admin)

    tool = tools(:one)
    patch spotlight_tool_url(tool)
    assert_redirected_to tools_url
    assert_equal "#{tool.name} is now the spotlighted tool.", flash[:notice]
    assert tool.reload.spotlighted?
  end
end
