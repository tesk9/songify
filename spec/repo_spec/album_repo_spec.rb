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

  describe("#update") do
    it "updates values for one album" do
      new_album = Songify::Album.new("Test Album", "Test About")
      @album_repo.add(new_album)
      updated = Songify::Album.new("Born to Run", "by Bruce Springsteen", "http://assets.rollingstone.com/assets/images/list/1ccdff7c10d78ca236e7272be46db2562737945a.JPG", "rock", 1975)
      @album_repo.update(1, updated)
      alb = @album_repo.get_by_id(1)
      expect(alb[0][1]).to eq("Born to Run")
      expect(alb[0][2]).to eq("by Bruce Springsteen")
      expect(alb[0][3]).to eq("http://assets.rollingstone.com/assets/images/list/1ccdff7c10d78ca236e7272be46db2562737945a.JPG")
      expect(alb[0][4]).to eq("Rock")
      expect(alb[0][5]).to eq("1975")
    end
  end
end