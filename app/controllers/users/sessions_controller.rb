class Users::SessionsController < Devise::SessionsController

  protected

  def after_sign_in_path_for user
    if user.admin?
      rails_admin_url
    else
      session[:tour_id] ? tour_path(session[:tour_id]) : super
    end
  end
end
