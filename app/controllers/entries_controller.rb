class EntriesController < ApplicationController
  def index
  end

  def new
    @user = User.find(params[:user_id])
    @entry = Entry.new
  end

  def create
    @user = User.find(params[:user_id])
    @entry = Entry.new(entry_params)
    if @entry.save
      session[:entry_id] = @entry.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @entry = Entry.find(params[:id])
    @user = User.find(params[:user_id])
    @comment = Comment.new
  end

  def edit
    @entry = Entry.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @entry = Entry.find(params[:id])
    @user = User.find(params[:user_id])
    @entry.update(entry_params)
    if @user.valid?
      flash[:notice] = "#{@entry.title} has been updated"
      redirect_to user_entry_path(@user, @entry)
    else
      render 'edit'
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @user = User.find(params[:user_id])
    @entry.destroy
    flash[:notice] = "#{@entry.title} has been deleted"
    redirect_to user_path(@user)
  end

private
  def entry_params
    params.require(:entry).permit(:title, :content).merge(:user_id => current_user.id)
  end
end
