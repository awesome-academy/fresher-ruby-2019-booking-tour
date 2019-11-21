class ToursController < SearchController
  before_action :search, only: :index
  before_action :load_tour, only: :show
  
  def index
    @tour_with_ratings = Tour.tour_with_rating
    @tour_lastest = Tour.last_tours
  end
  
  def show
    @ratings = @tour.ratings
    @review = Review.new
    @reviews = @tour.reviews
  end

  private

  def load_tour
    @tour = Tour.find_by id: params[:id]

    return if @tour
    flash[:danger] = t ".not_found"
    redirect_to tours_path
  end
end
