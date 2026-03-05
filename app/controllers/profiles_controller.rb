class ProfilesController < ApplicationController
  def edit
    @user = Current.user
  end

  def update
    @user = Current.user
    if @user.update(user_params)
      redirect_to edit_profile_path, notice: "Profile updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update_password
    @user = Current.user
    if @user.update(password_params)
      redirect_to edit_profile_path, notice: "Password updated successfully."
    else
      redirect_to edit_profile_path, alert: @user.errors.full_messages.to_sentence
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :bio, :location)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation, :password_challenge)
  end
end
