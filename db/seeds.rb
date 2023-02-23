# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require 'faker'

require 'open-uri'
require 'json'

url = "http://tmdb.lewagon.com/movie/top_rated"
response = URI.open(url).read
data = JSON.parse(response)
movies_array = data["results"]
puts "Creating table..."

movies_array.each do |movie|
  puts "Creating new movie..."
  title = movie["title"]
  overview = movie['overview']
  poster_url = "https://image.tmdb.org/t/p/original#{movie['poster_path']}"
  rating = movie['vote_average']
  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
end
