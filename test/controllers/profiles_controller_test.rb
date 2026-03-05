require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post session_url, params: { email_address: @user.email_address, password: "password" }
  end

  test "should get edit" do
    get edit_profile_url
    assert_response :success
  end

  test "should update profile" do
    patch profile_url, params: { user: { first_name: "New", last_name: "Name", location: "New Location", bio: "New Bio" } }
    assert_redirected_to edit_profile_url

    @user.reload
    assert_equal "New", @user.first_name
    assert_equal "Name", @user.last_name
    assert_equal "New Location", @user.location
    assert_equal "New Bio", @user.bio
  end

  test "should redirect to login when unauthenticated" do
    delete session_url
    get edit_profile_url
    assert_redirected_to new_session_url
  end
end
