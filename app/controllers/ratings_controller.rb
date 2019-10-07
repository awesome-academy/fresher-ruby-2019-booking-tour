class RatingsController < ApplicationController
  before_action :load_tour
  before_action :authenticate_user!, only: :create

  def create
    @rating = current_user.ratings.build rating_params
    @rating.tour_id = params[:tour_id]
    
    if @rating.save
      flash[:success] = t ".success_create"
      redirect_to @tour
    else
      respond_to do |format|
        format.js
      end
    end
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
