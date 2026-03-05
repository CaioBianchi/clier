require "test_helper"

class TwoFactorSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in_as(@user)
  end

  test "should get new" do
    get new_two_factor_settings_path
    assert_response :success
  end

  test "should enable 2FA with valid OTP" do
    # Ensure user has a secret
    @user.generate_otp_secret!

    totp = ROTP::TOTP.new(@user.otp_secret)
    valid_code = totp.now

    post two_factor_settings_path, params: { otp_code: valid_code }
    assert_redirected_to edit_profile_path
    assert @user.reload.otp_enabled?
  end

  test "should not enable 2FA with invalid OTP" do
    @user.generate_otp_secret!

    post two_factor_settings_path, params: { otp_code: "000000" }
    assert_response :unprocessable_entity
    assert_not @user.reload.otp_enabled?
  end

  test "should disable 2FA with valid password" do
    @user.update!(otp_enabled: true)

    delete two_factor_settings_path, params: { password: "password" }
    assert_redirected_to edit_profile_path
    assert_not @user.reload.otp_enabled?
  end
end
