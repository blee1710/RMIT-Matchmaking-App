class ApplicationController < ActionController::Base

  def hello
    render "layouts/welcome"
  end

  # redirecting the devise login

  def after_sign_in_path_for(resource)
    profile_pages_main_path
  end
  # this is to direct the user to the main page after logout
  def after_sign_out_path(resource)
    root_path
  end

  def after_update_path_for(resource)
    profile_pages_main_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :email, :password, :password_confirmation, :about, :post_code, :business, :business_type, :avatar, :avatar_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :email, :password, :password_confirmation, :about, :post_code, :business, :business_type, :avatar, :avatar_cache])
  end

end
