class AuthorsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @author = Author.all
  end

  def new
    @author = Author.new
    @books = Book.all
  end

  def create

    @author = Author.new(author_params)
    @author.save
    redirect_to authors_path
  end


  def edit
    @author = Author.find(params[:id])
    @books = Book.all
  end

  def update
    @author = Author.find(params[:id])
    @author.update(author_params)
    redirect_to authors_path
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_path
  end

  def show
    @author = Author.find(params[:id])
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name)
  end
end
