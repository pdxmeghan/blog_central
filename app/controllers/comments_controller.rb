class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      session[:comment_id] = @comment.id
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.valid?
      flash[:notice] = "Your comment has been updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Your comment has been deleted"
    redirect_to root_url
  end

private
  def comment_params
    params.require(:comment).permit(:text, :user_id, :entry_id).merge(:user_id => current_user.id)
  end
end
