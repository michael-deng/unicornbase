class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.sign_in_count == 1
       edit_category_registration_path(resource)
    else
       super
    end
	end

  protected

	  def configure_permitted_parameters
	    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :name, :password) }
	  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :description, :password_confirmation, :current_password) }
	  end
end
