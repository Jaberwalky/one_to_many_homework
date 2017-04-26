require_relative '../db/sql_runner.rb'

class Album

  attr_reader :id
  attr_accessor :title, :genre, :artist_id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @title = params['title']
    @genre = params['genre']
    @artist_id = params['artist_id']
  end

  def save()
    sql = "
    INSERT INTO albums (title, genre, artist_id) VALUES
    ('#{@title}', '#{@genre}', #{artist_id}) RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def Album.all()
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    return result.map {|hash| Album.new(hash)}
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    result = SqlRunner.run(sql)
    return result.map {|hash| Album.new(hash)}
  end



end

 # Every artist should have a name, and each album should have a name/title, genre and artist ID.