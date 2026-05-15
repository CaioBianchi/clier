require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup { @user = User.take }

  test 'new' do
    get new_session_path
    assert_response :success
  end

  test 'create with valid credentials' do
    post session_path, params: { email_address: @user.email_address, password: 'password' }

    assert_redirected_to root_path
    assert cookies[:session_id]
  end

  test 'create with valid credentials but 2FA enabled' do
    @user.update!(otp_enabled: true)
    @user.generate_otp_secret!

    post session_path, params: { email_address: @user.email_address, password: 'password' }

    assert_redirected_to two_factor_session_path
    assert_nil cookies[:session_id]
  end

  test 'submit correct 2FA code' do
    @user.update!(otp_enabled: true)
    @user.generate_otp_secret!

    # First step: enter email and password
    post session_path, params: { email_address: @user.email_address, password: 'password' }

    # Second step: enter valid OTP
    totp = ROTP::TOTP.new(@user.otp_secret)
    post two_factor_session_path, params: { otp_code: totp.now }

    assert_redirected_to root_path
    assert cookies[:session_id]
  end

  test 'create with invalid credentials' do
    post session_path, params: { email_address: @user.email_address, password: 'wrong' }

    assert_redirected_to new_session_path
    assert_nil cookies[:session_id]
  end

  test 'destroy' do
    sign_in_as(User.take)

    delete session_path

    assert_redirected_to new_session_path
    assert_empty cookies[:session_id]
  end
end
