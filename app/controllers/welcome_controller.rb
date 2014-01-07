class WelcomeController < ApplicationController
  def index
    @books = Book.all.sort_by { |book| book.rank }.reverse
    @movies = Movie.all.sort_by { |movie| movie.rank }.reverse
    @albums = Album.all.sort_by { |album| album.rank }.reverse
  end
end