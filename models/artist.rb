require_relative '../db/sql_runner.rb'

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result[0]["id"].to_i
  end

  def Artist.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def Artist.all()
    sql = "SELECT * FROM artists;"
    result = SqlRunner.run(sql)
    result.map {|hash| Artist.new(hash)}
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{id};"
    result = SqlRunner.run(sql)
    return result.map {|hash| Album.new(hash)}
  end

  def update()
    sql = "
    UPDATE artists SET (name) = ('#{@name}') WHERE id = #{@id}"
    return SqlRunner.run(sql)
  end

end