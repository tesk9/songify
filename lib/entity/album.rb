module Songify
  class Album
    attr_accessor :name, :about, :cover, :genre, :year

    def initialize(name, about, cover="", genre="", year="")
      @name = name
      @about = about
      @cover = cover
      @genre = genre
      @year = year
    end

  end
end