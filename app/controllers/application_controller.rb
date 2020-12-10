class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :image])
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :phone, :image, :password, :password_confirmation, :current_password)}
    end
end
