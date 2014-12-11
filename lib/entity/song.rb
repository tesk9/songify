module Songify
  class Song
    attr_accessor :name, :link, :album_id

    def initialize(name, link, album_id)
      @name = name
      @link = link
      @album_id = album_id
    end
    
  end
end