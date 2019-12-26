class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_user_details
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

  def require_user_login
    unless user_signed_in?
      session[:tour_id] = params[:tour_id]
      redirect_to new_user_session_path
    end
  end
  
  def get_user_details
    @current_user = current_user
    @activities = user_signed_in? ? User.get_activities_of(current_user.id) : []
  end

  def load_tour
    @tour = Tour.find_by id: params[:tour_id]

    return if @tour
    flash[:danger] = t ".not_found"
    redirect_to tours_path
  end

  protected

  
  def set_ransack_auth_object
    current_user&.admin? ? :admin : nil
  end
  
  def set_ransack_auth_object
    current_user&.admin? ? :admin : nil
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i(name phone_number)
    devise_parameter_sanitizer.permit :account_update, keys: [:name,
      :phone_number, picture_attributes: %i(id picture_link _destroy)]
  end
end
