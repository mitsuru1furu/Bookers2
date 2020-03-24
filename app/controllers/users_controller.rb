class UsersController < ApplicationController
    before_action :login_check, only: [:index, :new, :show, :edit, :update, :destroy]
    before_action :correct_user, only: [:edit, :update, :destroy]
  
  def login_check
    unless user_signed_in?
    flash[:alert] = "ログインしてください"
    redirect_to "/users/sign_in"
    end
  end
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
  def correct_user
      @user = User.find(params[:id])
      redirect_to(current_user) unless @user == current_user
  end
end
