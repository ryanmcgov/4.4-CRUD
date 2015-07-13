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
    @album = get_album
    @album.destroy!
    redirect_to albums_path
  end
  def show
    @album = get_album
  end
  def edit
    @album = get_album
  end
  def update
    @album = get_album
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
  def get_album 
    @album = Album.find(params[:id])
  end
end