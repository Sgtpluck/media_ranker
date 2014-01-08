class WelcomeController < ApplicationController
  def index
    @books = Book.all.sort_by { |book| book.rank }.reverse.take(5)
    @movies = Movie.all.sort_by { |movie| movie.rank }.reverse.take(5)
    @albums = Album.all.sort_by { |album| album.rank }.reverse.take(5)
  end
end