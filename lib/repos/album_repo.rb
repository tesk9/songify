module Songify::Repo
  class AlbumRepo < Repo

    def create_table
      drop_table
      command = <<-SQL
      CREATE TABLE albums (
        id SERIAL PRIMARY KEY,
        name text,
        about text
        );
      SQL
      @db.exec(command)
    end

    def drop_table
      command = <<-SQL
      DROP TABLE IF EXISTS albums;
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
      INSERT INTO albums (name, about)
      VALUES ('#{album.name}', '#{album.about}')
      SQL
      @db.exec(command)
    end
  end
end