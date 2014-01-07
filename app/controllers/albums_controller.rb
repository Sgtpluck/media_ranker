class AlbumsController < ApplicationController
  before_action :find_album, only: [:show, :rank, :destroy, :edit, :update]

  def index
    @albums = Album.all.sort_by { |album| album.rank }.reverse
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to albums_path, notice: 'Your album has been saved for judgment.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to album_path(@album.id)
    else
      render :edit
    end
  end

  def destroy
    @album.destroy
    redirect_to albums_path
  end

  def rank
    @album.update(rank: (@album.rank + 1))
    redirect_to album_path(@album.id)
  end

  private

  def find_album
    @album = Album.find(params[:id])
  end 

  def album_params
    params.require(:album).permit(:title, :artist, :description)
  end
end
