class PlaylistController < ApplicationController

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    name = params[:playlist][:name]

    @playlist = Playlist.new(name: name)

    if @playlist.save
      redirect_to @playlist
    else
      render new
    end

  end

  def show
    @playlist = Playlist.find(params[:id])

    @songs = Song.where(playlist_id: @playlist.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
