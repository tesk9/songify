require_relative "../spec_helper.rb"

describe Songify::Repo::SongRepo do
  before(:each) do
    @album_repo = Songify::Repo::AlbumRepo.new
    @album_repo.create_table

    new_album = Songify::Album.new("Album1", "About")
    @album_repo.add(new_album)
      new_album = Songify::Album.new("Album2", "About")
    @album_repo.add(new_album)

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

  describe "#delete" do
    it "removes matching row from songs table" do
      new_song = Songify::Song.new("Bad Song", "Link", 1)
      @song_repo.add(new_song)
      @song_repo.delete(1)
      expect(@song_repo.get_all(1)).to eq([])
    end
  end

  describe "#delete_by_album" do

    it "removes all songs from specified albums" do
      new_song = Songify::Song.new("Bad Song", "Link", 1)
      @song_repo.add(new_song)
      new_song = Songify::Song.new("Bad Song2", "Link", 1)
      @song_repo.add(new_song)
      new_song = Songify::Song.new("Bad Song3", "Link", 2)
      @song_repo.add(new_song)
      @song_repo.delete_by_album(1)
      expect(@song_repo.get_all(1)).to eq([])
    end

    it "does not remove songs from other albums" do
      new_song = Songify::Song.new("Bad Song", "Link", 1)
      @song_repo.add(new_song)
      new_song = Songify::Song.new("Bad Song2", "Link", 1)
      @song_repo.add(new_song)
      new_song = Songify::Song.new("Bad Song3", "Link", 2)
      @song_repo.add(new_song)
      @song_repo.delete_by_album(1)    
      expect(@song_repo.get_all(2)[0][1]).to eq("Bad Song3")
    end
  end
end
  