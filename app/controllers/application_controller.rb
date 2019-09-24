class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i(name phone_number)
    devise_parameter_sanitizer.permit :account_update, keys: [:name,
      :phone_number, picture_attributes: %i(id picture_link _destroy)]
  end
end
