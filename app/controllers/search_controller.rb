class SearchController < ApplicationController
  def search
    if params[:term].nil?
      @tours = []
      @reviews = []
    else
      @tours = Tour.search params[:term], fields: [:name, :description], highlight: true, page: params[:page], per_page: 4
      @reviews = Review.search params[:term], fields: [:content], highlight: true, page: params[:page], per_page: 4
    end 
  end
end