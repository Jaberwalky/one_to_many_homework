require_relative '../db/sql_runner.rb'

def Album

  attr_reader :id, :artist_id
  attr_accessor :title, :genre

  def initialize(params)
    @id = options['id'].to_i if options['id']
    @title = params['title']
    @genre = params['genre']
    @artist_id = params['artist_id']
  end


end

 # Every artist should have a name, and each album should have a name/title, genre and artist ID.