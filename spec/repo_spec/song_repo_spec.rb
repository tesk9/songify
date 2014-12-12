require_relative "../spec_helper.rb"

describe Songify::Repo::SongRepo do
  before(:each) do
    @song_repo = Songify::Repo::SongRepo.new
    @song_repo.create_table
  end

  describe "#add" do
    it "add a song to songs table" do
      new_song = Songify::Song.new("Song Name", "Song Link", 1)
      @song_repo.add(new_song)
      expect(@song_repo.get_all(1)[0][1]).to eq("Song Name")
    end
  end

  describe "#update" do
    it "updates values for one song" do
      new_song = Songify::Song.new("Bad Name", "Bad Link", 1)
      @song_repo.add(new_song)
      updated = Songify::Song.new("Better Name", "Working Link", 1)
      @song_repo.update(1, updated)
      song = @song_repo.get_all(1)[0]
      expect(song[1]).to eq("Better Name")
      expect(song[2]).to eq("Working Link")
    end
  end
end
