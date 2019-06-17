# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def index
  end

  # GET /resource/sign_up
  def new
    @user = User.new
    @user.build_personal
  end

  def sms_auth
    @sms = "phone-number"
  end

  def address
    @address = "name"
  end

  def payment
    @payment = "5555"
  end

  def registered
    @registered = "registered"
  end

  def create
    if session["devise.sns_id"] != nil #sns登録なら
      params[:user][:password] = "Devise.friendly_token.first(6)" #deviseのパスワード自動生成機能を使用
      params[:user][:password_confirmation] = "Devise.friendly_token.first(6)"
      super
      sns = SnsCredential.update(user_id:  @user.id)
    else #email登録なら
      @user = User.new(personal_params)
      if @user.save!
        redirect_to users_sms_auth_path
      else
        redirect_to new_user_registration_path
      end
    end
  end

  private
  def personal_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, personal_attributes: [:last_name, :first_name,:kana_first_name, :kana_last_name, :user_id])
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
