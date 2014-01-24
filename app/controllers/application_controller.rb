class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :update_sanitized_params, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :role, :date_of_birth, :about_me, :home_town, :current_location, :image]
  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:password, :password_confirmation, :current_password, :first_name, :last_name, :role, :date_of_birth, :about_me, :home_town, :current_location, :image)}
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    users_path
  end

  def after_update_path_for(resource)
    user_path(resource)
  end


end
