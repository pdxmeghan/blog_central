class CommentsController < ApplicationController
  before_filter :authorize, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      session[:comment_id] = @comment.id
      redirect_to user_entry_path(@comment.user, @comment.entry)
    else
      flash[:notice] = "Sorry, comment field must be filled in"
      redirect_to user_entry_path(@comment.user, @comment.entry)
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
      redirect_to user_entry_path(@comment.user, @comment.entry)
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
