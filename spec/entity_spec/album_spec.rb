require_relative '../spec_helper.rb'

describe Songify::Album do
  describe "#new" do
    it "initializes new album instance" do
      new_album = Songify::Album.new("Ziggy Stardust and the Spiders from Mars", "by David Bowie", "http://assets.rollingstone.com/assets/images/list/796577260b3b30587c896ff08e32c4b39c96e207.JPG")
      expect(new_album.name).to eq("Ziggy Stardust and the Spiders from Mars")
      expect(new_album.about).to eq("by David Bowie")
      expect(new_album.cover).to eq("http://assets.rollingstone.com/assets/images/list/796577260b3b30587c896ff08e32c4b39c96e207.JPG")
      expect(new_album.genre).to eq("")
      expect(new_album.year).to eq(0)
    end
  end
end