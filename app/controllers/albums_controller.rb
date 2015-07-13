class AlbumsController < ApplicationController
  def index
    @albums = Album.all 
  end
  def new
    @album = Album.new
  end
  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to albums_path
    else
      render :new
    end
  end
  def destroy
    @album = Album.find(params[:id])
    @album.destroy!
    redirect_to albums_path
  end
  def show
    @album = Album.find(params[:id])
  end
  def edit
    @album = Album.find(params[:id])
  end
  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to albums_path
    else
      render :show
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, :artist, :genre, :year, :length, :tracks)
  end
end