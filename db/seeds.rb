# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts 'Cleaning the DB...'
User.destroy_all
Chatroom.destroy_all

puts 'Creating users...'
luyee = User.new(
  nickname: "Luyee",
  email: "luyee@wong.com",
  password: "123123"
)
file = URI.open("https://avatars.githubusercontent.com/u/111058709?v=4")
luyee.photo.attach(io: file, filename: "luyee.jpg", content_type: "image/jpg")
luyee.save

alex = User.new(
  nickname: "Alex",
  email: "alex@wong.com",
  password: "123123"
)

url = 'https://this-person-does-not-exist.com/en'
doc = Nokogiri::HTML(URI.open(url).read)
src = doc.search('#avatar').first['src']
photo_url = "https://this-person-does-not-exist.com#{src}"
file = URI.open(photo_url)
alex.photo.attach(io: file, filename: 'alex.png', content_type: 'image/png')

puts 'Creating chatroom...'
Chatroom.new(name: "general")

puts "... created #{User.count} users and #{Chatroom.count} chatroom."
