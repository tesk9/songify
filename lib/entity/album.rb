module Songify
  class Album
    attr_accessor :name, :about

    def initialize(name, about)
      @name = name
      @about = about
    end

  end
end