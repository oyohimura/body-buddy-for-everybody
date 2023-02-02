# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Program.destroy_all
User.destroy_all

puts "Destroying database!"

# Creating users

puts "Generating 4 example users..."
user = User.new(
  password: 'Bob123$',
  email: 'bob@gmail.com',
  first_name: 'Bob',
  last_name: 'Dupont',
  address: '57 Rue Auber, 14150 Ouistreham',
  phone: '0123456789'
)
file = URI.open("https://img.huffingtonpost.com/asset/573cd81c1600002a00f93ce9.jpeg?ops=scalefit_720_noupscale")
user.profile_picture.attach(io: file, filename: "bob.jpeg", content_type: "image/jpeg")
user.save

user = User.new(
  password: 'Clara123$',
  email: 'clara@gmail.com',
  first_name: 'Clara',
  last_name: 'Moriconi',
  address: 'rue de la montage, 67210 Obernai',
  phone: '0123456789'
)

file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1663345881/yaxmecvbe7skaqrm4ziw.jpg")
user.profile_picture.attach(io: file, filename: "clara.jpg", content_type: "image/jpg")
user.save

user = User.new(
  password: 'Yamato123$',
  email: 'yamato@gmail.com',
  first_name: 'Yamato',
  last_name: 'Belhouchet',
  address: 'rue du Japon, Paris',
  phone: '0123456789'
)

file = URI.open("https://avatars.githubusercontent.com/u/113622459?v=4")
user.profile_picture.attach(io: file, filename: "yamato.jpg", content_type: "image/jpg")
user.save

user = User.new(
  password: 'Arnaud123$',
  email: 'arnaud@gmail.com',
  first_name: 'Arnaud',
  last_name: 'Metral',
  address: 'rue de Brasilia, 72100 Le Mans',
  phone: '0123456789'
)

file = URI.open("https://avatars.githubusercontent.com/u/111865610?v=4")
user.profile_picture.attach(io: file, filename: "arnaud.jpg", content_type: "image/jpg")
user.save

# Creating programs
# TODO

# Create batch
# TODO

# Create lessons
# TODO

# Create teachers
# TODO

# A SUPPRIMER (ci-dessous)

file = URI.open("https://cdn.shopify.com/s/files/1/0308/7024/1420/products/blue-R-1_870x580.jpg?v=1668396768")

bike1 = Bike.new(brand: "Decathlon", model: "Riverside", location: "Paris", price: 8, electric: true, user_id: 1,
description: "My beautiful all-terrain bike is the perfect companion for all of my adventures. Whether I'm hitting the trails or exploring back roads, this bike can handle anything. With its durable frame and sturdy tires, I never have to worry about getting stuck or having to turn back. And the smooth ride it provides makes every journey a joy. I am so lucky to have this bike and all the wonderful experiences it has taken me on.")
bike1.picture.attach(io: file, filename: "bike_decathlon.jpg", content_type: "image/jpg")
bike1.user = User.where(first_name: 'Bob').first
bike1.save

puts "Generating first bike..."

puts "Generating 2 example rents..."
rent = Rent.new(
  start_date: "2013-02-02 01:00:00 UTC",
  end_date: "2013-02-04 01:00:00 UTC"
)
rent.user = User.where(first_name: 'Yamato').first
rent.bike = Bike.where(brand: 'Trek').first
rent.rent_price = Bike.where(brand: 'Trek').first.price
rent.save!

rent = Rent.new(
  start_date: "2014-02-02 01:00:00 UTC",
  end_date: "2014-02-04 01:00:00 UTC"
)
rent.user = User.where(first_name: 'Yamato').first
rent.bike = Bike.where(brand: 'EDEN-BIKES').first
rent.rent_price = Bike.where(brand: 'EDEN-BIKES').first.price
rent.save!

puts "Finished!"
