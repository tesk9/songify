require 'sinatra'
require 'sinatra/json'
require "sinatra/reloader" if development?

require_relative 'songify.rb'

album_repo = Songify::Repo::AlbumRepo.new
song_repo = Songify::Repo::SongRepo.new
# song_repo.create_table
album_repo.create_table

set :bind, '0.0.0.0' # This is needed for Vagrant

get '/' do
  @albums = album_repo.get_all
  erb :albums, :layout => :index
end

post '/' do
  new_album = Songify::Album.new(params["new-album"], params["about-new-album"], params["cover"], params["genre"], params["year"])
  album_repo.add(new_album)
  redirect to('/')
end

get '/albums/:id' do
  @album = album_repo.get_by_id(params[:id])
  @songs = song_repo.get_all(params[:id])
  erb :one_album, :layout => :index
end

post '/albums/:id' do
  new_song = Songify::Song.new(params["song-name"], params["youtube-link"], params[:id])
  song_repo.add(new_song)
  redirect to('/')
end