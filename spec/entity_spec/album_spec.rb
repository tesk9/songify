require_relative '../spec_helper.rb'

describe Songify::Album do
  describe "#new" do
    it "initializes new album instance" do
      new_album = Songify::Album.new("Test Name", "Test About")
      expect(new_album.name).to eq("Test Name")
      expect(new_album.about).to eq("Test About")
    end
  end
end