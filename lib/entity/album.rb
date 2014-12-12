module Songify
  class Album
    attr_accessor :name, :about, :cover

    def initialize(name, about, cover="")
      @name = name
      @about = about
      @cover = cover
    end

  end
end