class SongController < ApplicationController

  require 'soundcloud'

  def search

  end

  def results

    @query = params[:q]

    client = Soundcloud.new(:client_id => '9945169c68a743c3dc4e74ee562d5be8')

    @tracks = client.get('/tracks', :q => @query.to_s, :limit => 8)

    @embed_info = []

    @tracks.each do |t|
      client = Soundcloud.new(:client_id => '9945169c68a743c3dc4e74ee562d5be8')
      info = client.get('/oembed', :url => t.permalink_url)
      @embed_info << info['html']
    end

  end

  def add
    song = Song.create(:playlist_id => params[:playlist_id], :embed_code => params[:embed_code])

    redirect_to playlist_path(id: params[:playlist_id])
  end
end
