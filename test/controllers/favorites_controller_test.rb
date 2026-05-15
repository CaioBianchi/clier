require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @tool = tools(:one)
  end

  test 'should create favorite when authenticated' do
    post session_url, params: { email_address: @user.email_address, password: 'password' }

    # tool(:two) is not favorited by user(:one)
    assert_difference('Favorite.count', 1) do
      post tool_favorite_url(tools(:two))
    end
    assert_redirected_to root_url
  end

  test 'should destroy favorite when authenticated' do
    post session_url, params: { email_address: @user.email_address, password: 'password' }
    Favorite.create!(user: @user, tool: @tool)

    assert_difference('Favorite.count', -1) do
      delete tool_favorite_url(@tool)
    end
    assert_redirected_to root_url
  end
end
