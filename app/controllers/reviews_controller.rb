class ReviewsController < ApplicationController
  before_action :load_tour, only: :create
  before_action :load_review, only: :show
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build review_params
    @review.tour_id = params[:tour_id]

    if @review.save
      flash[:success] = t ".success_created"
      redirect_to @tour
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit Review::REVIEW_PARAMS
  end

  def load_tour
    @tour = Tour.find_by id: params[:tour_id]

    return if @tour
    flash[:danger] = t ".not_found"
    redirect_to root_path
  end

  def load_review
    @review = Review.find_by id: params[:id]

    return if @review
    flash[:danger] = t ".not_found"
    redirect_to root_path
  end
end
