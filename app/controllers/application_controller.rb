class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from Exception, with: :error_500 unless Rails.env.development?
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u|
      u.permit(:username, :password, :password_confirmation, :email)
    }
    devise_parameter_sanitizer.for(:sign_in) {|u|
      u.permit(:username, :password, :remember_me)
    }
  end
end
