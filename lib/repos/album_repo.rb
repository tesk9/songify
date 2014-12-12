module Songify::Repo
  class AlbumRepo < Repo

    def create_table
      drop_table
      command = <<-SQL
      CREATE TABLE albums (
        id SERIAL PRIMARY KEY,
        name text,
        about text,
        cover text,
        genre text,
        year integer
        );
      SQL
      @db.exec(command)
    end

    def drop_table
      command = <<-SQL
      DROP TABLE IF EXISTS albums CASCADE;
      SQL
      @db.exec(command)
    end

    def get_all
      command = <<-SQL
      SELECT * FROM albums;
      SQL
      results = @db.exec(command)
      results.values
    end

    def get_by_id(id)
      command = <<-SQL
      SELECT * FROM albums
      WHERE id='#{id}';
      SQL
      results = @db.exec(command)
      results.values
    end

    def add(album)
      command = <<-SQL
      INSERT INTO albums (name, about, cover, genre, year)
      VALUES ('#{album.name}', '#{album.about}', '#{album.cover}', '#{album.genre}', '#{album.year}');
      SQL
      @db.exec(command)
    end

    def update(album_id, album)
      command = <<-SQL
      UPDATE albums
      SET name='#{album.name}',
        about='#{album.about}',
        cover='#{album.cover}',
        genre='#{album.genre}',
        year='#{album.year}'
      WHERE id='#{album_id}';
      SQL
      @db.exec(command)
    end
  end
end