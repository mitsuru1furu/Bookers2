class BooksController < ApplicationController
	def index
		@book = Book.new
		@books = Book.all
		@user = User.where(user_id: current_user.id)

	end
	def show
		@book = Book.new
		@book2 = Book.find_by(id: params[:id])
		@user = User.find_by(id: @book2.user_id)
		
	end
	def create
		@book = Book.new(book_params)
		@books = Book.all
		@book.user_id = current_user.id
		if @book.save
		   redirect_to "/books/#{@book.id}", notice: 'You have creatad book successfully.'
		else
		   render :index
		end
	end
	def edit
		@book = Book.new
		@book = Book.find(params[:id])
	end
	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
		   redirect_to "/books/#{@book.id}", notice: 'You have updated book successfully.'
		else
		   render :edit
		end
	end
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to @book
	end
	private
	def book_params
		params.require(:book).permit(:title,:body)
	end
end
