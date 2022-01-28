require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 user = User.first

prng = Random.new
 puts "Iniciando info de libros"
 10.times do
book = Book.create(
  title: Faker::Book.title,
  author: Faker::Book.author,
  description: Faker::Books::Dune.quote,
  released_year: prng.rand(1990..2021),
  price: prng.rand(10..30),
  category: Faker::Book.genre,
  status: 0,
  user_id: 1)
 end
