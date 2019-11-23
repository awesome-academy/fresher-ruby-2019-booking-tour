class ReviewsController < ApplicationController
  before_action :require_user_login
  before_action :load_tour, only: :create
  before_action :load_review, only: %i(edit update)

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
      flash[:danger] = t ".fail_create"
      respond_to :js
    end
  end

  def update
    if @review.update review_params
      flash[:success] = "Success Update"
      redirect_to @review
    else
      render :edit
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
