class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def set_search
    @search = Tour.ransack params[:search], auth_object: set_ransack_auth_object
    @search.sorts = Settings.default_sort if @search.sorts.empty?
    @tours = @search.result
      .page(params[:page])
      .per Settings.paging.paging_number
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
  end

  def after_sign_in_path_for user
    session[:forward_url] ? session.delete(:forward_url) : super
  end
  
  def require_user_login
    unless user_signed_in?
      session[:forward_url] = request.fullpath
      redirect_to new_user_session_path
    end
  end
  
  protected
  
  def set_ransack_auth_object
    current_user&.admin? ? :admin : nil
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i(name phone_number)
    devise_parameter_sanitizer.permit :account_update, keys: [:name,
      :phone_number, picture_attributes: %i(id picture_link _destroy)]
  end
end
