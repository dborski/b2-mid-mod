# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

studio1 = Studio.create(name: "studio1", location: "location1")
studio2 = Studio.create(name: "studio2", location: "location2")

movie1 = studio1.movies.create(title: "movie1", creation_year: "year1", genre: "genre1")
movie2 = studio1.movies.create(title: "movie2", creation_year: "year2", genre: "genre2")
movie3 = studio2.movies.create(title: "movie3", creation_year: "year3", genre: "genre3")
