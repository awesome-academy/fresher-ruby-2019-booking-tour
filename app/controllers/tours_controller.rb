class ToursController < ApplicationController
  before_action :load_tour, only: :show
  
  def index
    @tour_with_ratings = Tour.tour_with_rating.page(params[:page]).per 10
    @tour_lastest = Tour.last_tours.page(params[:page]).per 10
  end
  
  def show
    @review = Review.new
    @reviews = @tour.reviews
    @rating = Rating.new
  end

  private

  def load_tour
    @tour = Tour.find_by id: params[:id]

    return if @tour
    flash[:danger] = t ".not_found"
    redirect_to tours_path
  end
end
