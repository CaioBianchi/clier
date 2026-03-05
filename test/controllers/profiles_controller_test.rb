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

  test "should update password with valid challenge" do
    patch password_profile_url, params: { user: { password_challenge: "password", password: "newpassword", password_confirmation: "newpassword" } }
    assert_redirected_to edit_profile_url
    assert_equal "Password updated successfully.", flash[:notice]

    @user.reload
    assert @user.authenticate("newpassword")
  end

  test "should not update password with invalid challenge" do
    patch password_profile_url, params: { user: { password_challenge: "wrongpassword", password: "newpassword", password_confirmation: "newpassword" } }
    assert_redirected_to edit_profile_url
    assert_equal "Password challenge is invalid", flash[:alert]

    @user.reload
    assert @user.authenticate("password")
  end
end
