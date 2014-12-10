require 'sinatra'
require 'sinatra/json'
require "sinatra/reloader" if development?

require_relative 'songify.rb'

album_repo = Songify::Repo::AlbumRepo.new
album_repo.create_table
new_album = Songify::Album.new("Test Album", "TEST")
album_repo.add(new_album)
new_album = Songify::Album.new("Test Album2", "TEST")
album_repo.add(new_album)

set :bind, '0.0.0.0' # This is needed for Vagrant

get '/' do
  @albums = album_repo.get_all
  erb :index
end

post '/' do
  new_album = Songify::Album.new(params["new-album"], params["about-new-album"])
  album_repo.add(new_album)
  redirect to('/')
end