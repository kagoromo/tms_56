class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]

  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit :email,
      :name, :password, :password_confirmation}
  end

  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit :email,
      :name, :current_password, :password, :password_confirmation}
  end
end
