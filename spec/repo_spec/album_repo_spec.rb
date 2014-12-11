require_relative "../spec_helper.rb"

describe Songify::Repo::AlbumRepo do
  before(:each) do
    @album_repo = Songify::Repo::AlbumRepo.new
    @album_repo.create_table
  end

  describe("#new") do
    it "add album to database" do
      new_album = Songify::Album.new("Test Album", "TEST")
      @album_repo.add(new_album)
      expect(@album_repo.get_all[0][1]).to eq("Test Album")
    end
  end

  describe("#get_by_id") do
    it "get album by id" do
      new_album = Songify::Album.new("Test Album", "TEST")
      @album_repo.add(new_album)
      expect(@album_repo.get_by_id(1)[0][1]).to eq("Test Album")
    end
  end

  describe("#get_all") do
    it "get all albums" do
      new_album = Songify::Album.new("Test Album", "TEST")
      @album_repo.add(new_album)
      new_album = Songify::Album.new("Test Album2", "TEST")
      @album_repo.add(new_album)
      expect(@album_repo.get_all[0][1]).to eq("Test Album")
      expect(@album_repo.get_all[1][1]).to eq("Test Album2")
    end
  end
end