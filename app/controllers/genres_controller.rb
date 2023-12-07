class GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.all
  end

  def new
    @genre = Genre.new
    @books = Book.all
  end

  def create

    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to genres_path
  end


  def edit
    @genre = Genre.find(params[:id])
    @books = Book.all
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to genres_path
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to genres_path
  end

  def show
    @genre = Genre.find(params[:id])
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:title)
  end

end
