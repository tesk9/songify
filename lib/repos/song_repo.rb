module Songify::Repo
  class SongRepo < Repo

    def create_table
      drop_table
      command = <<-SQL
      CREATE TABLE songs (
        id SERIAL PRIMARY KEY,
        name text,
        link text,
        album_id integer REFERENCES albums (id)
      );
      SQL
      @db.exec(command)
    end

    def add(song)
      command = <<-SQL
      INSERT INTO songs (name, link, album_id)
      VALUES('#{song.name}', '#{song.link}', '#{song.album_id}');
      SQL
      @db.exec(command)
    end

    def get_all(album_id)
      command = <<-SQL
      SELECT * FROM songs
      WHERE album_id='#{album_id}'
      SQL
      results = @db.exec(command)
      results.values
    end

    def drop_table
      command = <<-SQL
      DROP TABLE IF EXISTS songs;
      SQL
      @db.exec(command)
    end
  end
end