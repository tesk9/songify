require 'sinatra'
require 'sinatra/json'
require "sinatra/reloader" if development?

require_relative 'songify.rb'

album_repo = Songify::Repo::AlbumRepo.new
song_repo = Songify::Repo::SongRepo.new
# song_repo.create_table
# album_repo.create_table

set :bind, '0.0.0.0' # This is needed for Vagrant

get '/' do
  @albums = album_repo.get_all
  @message = (@albums != []) ?  "Your Albums:" : ""
  erb :albums, :layout => :index
end

post '/' do
  new_album = Songify::Album.new(params["new-album"], params["about-new-album"], params["cover"], params["genre"], params["year"].to_i)
  album_repo.add(new_album)
  redirect to('/')
end

get '/genre' do
  genre = params["genre"].downcase.capitalize
  @albums = album_repo.get_by_genre(genre)
  @message = (@albums != []) ?  "Filtering by Genre for #{genre}:" : ""
  erb :albums, :layout => :index
end

get '/albums/:id' do
  @album = album_repo.get_by_id(params[:id])
  @songs = song_repo.get_all(params[:id])
  erb :one_album, :layout => :index
end

post '/albums/:id' do
  new_song = Songify::Song.new(params["song-name"], params["youtube-link"], params[:id])
  song_repo.add(new_song)
  redirect to("/albums/#{params[:id]}")
end

get '/albums/edit/:id' do
  @album = album_repo.get_by_id(params[:id])
  erb :edit_album, :layout => :index
end

post '/albums/edit/:id' do
  updated = Songify::Album.new(params["album"], params["about"], params["cover"], params["genre"], params["year"])
  album_repo.update(params[:id], updated)
  redirect to("/albums/#{params[:id]}")
end

get '/albums/:id/delete' do
  song_repo.delete_by_album(params[:id])
  album_repo.delete_by_id(params[:id])
  redirect to("/")
end

get '/albums/:id/songs/delete' do
  song_repo.delete_by_album(params[:id])
  redirect to("/albums/#{params[:id]}")
end

post '/albums/:id/songs/edit/:song_id' do
  updated = Songify::Song.new(params["name"], params["link"], params[:id])
  song_repo.update(params[:song_id], updated)
  redirect to("/albums/#{params[:id]}")
end

post '/albums/:id/songs/delete/:song_id' do
  song_repo.delete(params[:song_id])
  redirect to("/albums/#{params[:id]}")
end
