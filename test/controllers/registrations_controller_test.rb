require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_registration_url
    assert_response :success
  end

  test "should create registration" do
    assert_difference("User.count", 1) do
      post registration_url, params: { user: { first_name: "New", last_name: "User", email_address: "new@example.com", password: "password", password_confirmation: "password" } }
    end
    assert_redirected_to root_url
  end

  test "should not create registration with invalid data" do
    assert_no_difference("User.count") do
      post registration_url, params: { user: { email_address: "invalid", password: "password", password_confirmation: "mismatch" } }
    end
    assert_response :unprocessable_entity
  end
end
