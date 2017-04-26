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

  def Artist.all()
    sql = "SELECT * FROM artists;"
    result = SqlRunner.run(sql)
    result.map {|hash| Artist.new(hash)}
  end



end