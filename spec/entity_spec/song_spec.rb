require_relative '../spec_helper.rb'

describe Songify::Song do
  describe "#new" do
    it "initializes new song" do
      new_song = Songify::Song.new("Song Name", "www.youtube.com", 1)
      expect(new_song.name).to eq("Song Name")
      expect(new_song.link).to eq("www.youtube.com")
      expect(new_song.album_id).to eq(1)
    end
  end
end