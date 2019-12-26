class RatingsController < ApplicationController
  before_action :load_tour, only: :create
  before_action :require_user_login, only: :create

  def create
    @rated = Rating.user_rated(current_user.id, params[:tour_id])

    if @rated.blank?
      @rating = current_user.ratings.build rating_params
      @rating.tour_id = params[:tour_id]
      @rating.save
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
end
