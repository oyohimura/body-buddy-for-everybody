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
file1 = URI.open("https://fakeimage1.jpg")
program1 = Program.new(discipline: 'Yoga', level: 'Beginner', target: 'Stress relief', duration: 60, teacher_id: 1, price: 10, description: 'Introducing the basics of yoga and breathing techniques to help relieve stress', language: 'English')
program1.picture.attach(io: file1, filename: "program1.jpg", content_type: "image/jpg")
program1.user = User.where(first_name: 'Bob').first
program1.save

file2 = URI.open("https://fakeimage2.jpg")
program2 = Program.new(discipline: 'Pilates', level: 'Intermediate', target: 'Flexibility and strength', duration: 45, teacher_id: 2, price: 15, description: 'Improve flexibility and strength with Pilates', language: 'English')
program2.picture.attach(io: file2, filename: "program2.jpg", content_type: "image/jpg")
program2.user = User.where(first_name: 'Bob').first
program2.save

file3 = URI.open("https://fakeimage3.jpg")
program3 = Program.new(discipline: 'Dance', level: 'Advanced', target: 'Fun and fitness', duration: 75, teacher_id: 3, price: 20, description: 'Get fit and have fun with dance', language: 'English')
program3. picture.attach(io: file3, filename: "program3.jpg", content_type: "image/jpg")
program3.user = User.where(first_name: 'Bob').first
program3.save

file4 = URI.open("https://fakeimage4.jpg")
program4 = Program.new(discipline: 'Meditation', level: 'Beginner', target: 'Stress relief and mindfulness', duration: 30, teacher_id: 4, price: 5, description: 'Introduction to stress relief and mindfulness through meditation', language: 'English')
program4. picture.attach(io: file4, filename: "program4.jpg", content_type: "image/jpg")
program4.user = User.where(first_name: 'Bob').first
program4.save

# TODO

# Create batch
batch1 = Batch.new(program_id: 1, start_time: "2023-03-01 10:00:00", end_time: "2023-03-01 12:00:00", location: "London", max_students: 20)
batch1.save

batch2 = Batch.new(program_id: 2, start_time: "2023-03-02 14:00:00", end_time: "2023-03-02 16:00:00", location: "Paris", max_students: 15)
batch2.save

# TODO

# Create lessons
lessons = [
{title: "Introduction to Yoga", description: "Learn the basics of yoga and how to breathe properly."},
{title: "Sun Salutations", description: "Practice the flowing sequence of postures to warm up your body."},
{title: "Warrior Pose", description: "Improve balance and strengthen your legs with this powerful posture."},
{title: "Tree Pose", description: "Find inner peace and focus while balancing on one foot."},
{title: "Child's Pose", description: "Relax and release tension in your back and hips with this gentle posture."}
]


5.times do |i|
lesson = Lesson.new(batch_id: first_batch.id, number: i + 1, title: lessons[i][:title], description: lessons[i][:description])
lesson.save
end


5.times do |i|
lesson = Lesson.new(batch_id: second_batch.id, number: i + 1, title: lessons[i][:title], description: lessons[i][:description])
lesson.save
end


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
