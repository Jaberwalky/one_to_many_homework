require('pry-byebug')
require_relative '../models/album.rb'
require_relative '../models/artist.rb'

artist1 = Artist.new({"name" => "Sia"})
artist1.save()
artist2 = Artist.new({"name" => "Pink Floyd"})
artist2.save()

album1 = Album.new({
  "title" => "Colour the small one", 
  "genre" => "pop", 
  "artist_id" => artist1.id
})

album2 = Album.new({
  "title" => "Dark Side Of The Moon", 
  "genre" => "rock", 
  "artist_id" => artist2.id
})

album1.save()
album2.save()










binding.pry
nil