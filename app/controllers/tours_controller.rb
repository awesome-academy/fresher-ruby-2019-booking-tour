class ToursController < ApplicationController
  before_action :load_tour, only: :show
  
  def index
    @search = Tour.ransack params[:search]
    @search.sorts = Settings.default_sort if @search.sorts.empty?
    @tours = @search.result
      .joins(:category)
      .page(params[:page])
      .per Settings.paging.paging_number
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
  end
  
  def show
    @ratings = @tour.ratings
    @review = Review.new
    @reviews = @tour.reviews
    
    if @ratings.any? 
      @average_review = @ratings.average(:star).round(Settings.round_default)
    else
      @average_review = Settings.average_default
    end
  end

  private

  def load_tour
    @tour = Tour.find_by id: params[:id]

    return if @tour
    flash[:danger] = t ".not_found"
    redirect_to tours_path
  end
end
