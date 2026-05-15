class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[new create two_factor]
  rate_limit to: 10, within: 3.minutes, only: :create, with: lambda {
    redirect_to new_session_path, alert: 'Try again later.'
  }

  def new
  end

  def create
    if user = User.authenticate_by(params.permit(:email_address, :password))
      if user.otp_enabled?
        session[:pre_2fa_auth_user_id] = user.id
        redirect_to two_factor_session_path
      else
        start_new_session_for user
        redirect_to after_authentication_url
      end
    else
      redirect_to new_session_path, alert: 'Try another email address or password.'
    end
  end

  def two_factor
    @user = User.find_by(id: session[:pre_2fa_auth_user_id])
    if @user.nil?
      redirect_to new_session_path, alert: 'Please log in first.'
      return
    end

    return unless request.post?

    if @user.verify_otp(params[:otp_code])
      session.delete(:pre_2fa_auth_user_id)
      start_new_session_for @user
      redirect_to after_authentication_url
    else
      flash.now[:alert] = 'Invalid two-factor code. Please try again.'
      render :two_factor, status: :unprocessable_entity
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path, status: :see_other
  end
end
