class BooksController < ApplicationController
  before_action :authenticate_admin!

  def index
    # print("Current : " + current_admin.email)
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
    #@books = Book.all
  end

  def new
    @book = Book.new
    @authors = Author.all
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to books_path
  end


  def edit
    @book = Book.find(params[:id])
    @authors = Author.all
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
  
    redirect_to books_path, notice: 'successfully deleted.'
  end
  

  def show
    @book = Book.find(params[:id])
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :quantity, :added_by, :genre , author_ids: [])
  end
end
