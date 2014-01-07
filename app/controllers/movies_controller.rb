class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :rank, :destroy, :edit, :update]

  def index
    @movies = Movie.all.sort_by { |movie| movie.rank }.reverse
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: 'Your movie has been saved for judgment.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to movie_path(@movie.id)
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  def rank
    @movie.update(rank: (@movie.rank + 1))
    redirect_to movie_path(@movie.id)
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end 

  def movie_params
    params.require(:movie).permit(:title, :director, :description)
  end

end