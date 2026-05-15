class TwoFactorSettingsController < ApplicationController
  def new
    @user = Current.user

    # Generate new secret if not already present
    @user.generate_otp_secret! if @user.otp_secret.nil?

    qrcode = RQRCode::QRCode.new(@user.otp_provisioning_uri)
    @svg = qrcode.as_svg(
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 4,
      standalone: true,
      use_path: true
    )
  end

  def create
    @user = Current.user

    if @user.verify_otp(params[:otp_code])
      @user.update!(otp_enabled: true)
      redirect_to edit_profile_path, notice: 'Two-factor authentication has been enabled.'
    else
      flash.now[:alert] = 'Invalid verification code. Please try again.'
      qrcode = RQRCode::QRCode.new(@user.otp_provisioning_uri)
      @svg = qrcode.as_svg(
        color: '000',
        shape_rendering: 'crispEdges',
        module_size: 4,
        standalone: true,
        use_path: true
      )
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user = Current.user

    if @user.authenticate(params[:password])
      @user.update!(otp_enabled: false)
      redirect_to edit_profile_path, notice: 'Two-factor authentication has been disabled.'
    else
      redirect_to edit_profile_path, alert: 'Incorrect password. Two-factor authentication was not disabled.'
    end
  end
end
