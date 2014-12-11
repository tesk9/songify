require 'pg'
module Songify::Repo
  class Repo
    def initialize
      @db = PG.connect(dbname: 'music-manager-db')
    end
  end
end

require_relative "album_repo.rb"
require_relative "song_repo.rb"