class RatingsController < ApplicationController
  before_action :load_tour
  before_action :authenticate_user!, only: :create

  def create
    @rated = Rating.user_rated(current_user.id, params[:tour_id])
    if @rated.blank?
      @rate = current_user.ratings.build rating_params
      @rate.tour_id = params[:tour_id]
      @rate.save
      
      flash[:success] = t ".success_create"
    else
      @rated.update star: params[:rating][:star].to_i
    end
    redirect_to @tour
  end

  private

  def rating_params
    params.require(:rating).permit Rating::RATING_PARAMS
  end

  def load_tour
    @tour = Tour.find_by id: params[:tour_id]

    return if @tour
    flash[:danger] = t ".not_found"
    redirect_to tours_path
  end
end
