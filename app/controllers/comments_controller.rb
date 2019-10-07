class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_commentable
  before_action :load_comment, except: %i(index create)
  
  def reply
    @reply = @commentable.comments.build parent: @comment
  end
  
  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    @comment.review_id = @commentable.id
    
    if @comment.save
      respond_to do |format|
        format.html {redirect_to @commentable, notice: t(".comment_success")}
        format.json {render json: @comment}
        format.js
      end
    else
      respond_to do |format|
        format.html {render :new, notice: t(".comment_fail")}
        format.json {render json: @comment.errors}
        format.js
      end
    end
  end

  def update
    if @comment.update comment_params
      respond_to do |format|
        format.html {redirect_to @commentable, notice: t(".success_update")}
        format.json {render json: @comment}
        format.js
      end
    else
      respond_to do |format|
        format.html {redirect_to :edit, notice: t(".fail_update")}
        format.json {render json: @comment.errors}
        format.js
      end
    end
  end

  def destroy
    if @comment.errors.empty? && @comment.destroy
      respond_to do |format|
        format.html {redirect_to @commentable, notice: t(".success_delete")}
        format.json {head :not_content}
        format.js
      end
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit Comment::COMMENT_PARAMS
  end
  
  def load_commentable
    resources, id = request.path.split('/')[1, 2]
    @commentable = resources.singularize.classify.constantize.find(id)
  end

  def load_comment
    @comment = @commentable.comments.find_by id: params[:id]

    return if @comment
    flash[:danger] = t ".not_found"
    return root_path
  end
end
