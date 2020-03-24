class UsersController < ApplicationController
  def index
  	  @users = User.all
  	  @book = Book.new
  end
  def show
  	  @book = Book.new
  	  @user = User.find(params[:id])
  	  @books = @user.books.page(params[:page]).reverse_order
  end
  def edit
  	  @user = User.find(params[:id])
  end
  def update
  	  @user = User.find(params[:id])
  	  if @user.update(user_params)
  	  redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
      else
        render :edit
      end
  end
  private
  def user_params
  	  params.require(:user).permit(:name, :profile_image, :introduction)
  end
end