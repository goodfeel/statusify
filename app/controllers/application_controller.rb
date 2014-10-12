class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    timeline_index_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username, :bio, :location]
    devise_parameter_sanitizer.for(:account_update) { |u| 
      u.permit(:password, :password_confirmation, :current_password, :bio, :location) 
    }

  end
end

