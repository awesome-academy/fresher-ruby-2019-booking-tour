class LikesController < ApplicationController
  before_action :require_user_login
  before_action :load_review
  
  def create
    unless current_user.liked? @review.id
      @like = current_user.likes.build
      @like.review = @review
    end
    respond_to {|format| format.js} if @like.save
  end

  def destroy
    @like = Like.find_by id: params[:id]
    respond_to {|format| format.js} if @like.destroy
  end

  private

  def load_review
    @review = Review.find_by id: params[:review_id]

    return if @review
    flash[:danger] = t ".not_found"
    redirect_to reviews_path
  end
end
