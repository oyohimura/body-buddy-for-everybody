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

# Create teachers
puts "Generating 2 example teachers..."
teacher1 = Teacher.new(user: user, description: "Experienced Yoga teacher with over 10 years of experience teaching beginners and advanced students alike.", language: "English")
teacher1.user = User.where(first_name: 'Bob').first
teacher1.save

teacher2 = Teacher.new(user: user, description: "Certified Pilates instructor with a passion for helping people improve their fitness and flexibility.", language: "English")
teacher2.user = User.where(first_name: 'Clara').first
teacher2.save


# Creating programs
puts "Generating 4 example programs..."
file1 = URI.open("https://media.istockphoto.com/id/647232406/fr/photo/professeur-dyoga-mexicain-m%C3%A9ditant.jpg?s=612x612&w=is&k=20&c=2pa2DIqWNOnvrDBKOoYwE-Z7Le3kcebQXhKZpvWCqMc=")
program1 = Program.new(discipline: 'Yoga', level: 'Beginner', target: 'Stress relief', duration: 60, teacher_id: 1, price: 10, description: 'Introducing the basics of yoga and breathing techniques to help relieve stress', language: 'English')
program1.medias.attach(io: file1, filename: "program1.jpg", content_type: "image/jpg")
user = User.where(first_name: 'Bob').first
program1.teacher = Teacher.find_by(user: user)
program1.save

file2 = URI.open("https://plus.unsplash.com/premium_photo-1672039973087-904269a23edc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")
program2 = Program.new(discipline: 'Pilates', level: 'Intermediate', target: 'Flexibility and strength', duration: 45, teacher_id: 2, price: 15, description: 'Improve flexibility and strength with Pilates', language: 'English')
program2.medias.attach(io: file2, filename: "program2.jpg", content_type: "image/jpg")
user = User.where(first_name: 'Clara').first
program2.teacher = Teacher.find_by(user: user)
program2.save

file3 = URI.open("https://images.unsplash.com/photo-1540324155974-7523202daa3f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80")
program3 = Program.new(discipline: 'Dance', level: 'Advanced', target: 'Fun and fitness', duration: 75, teacher_id: 3, price: 20, description: 'Get fit and have fun with dance', language: 'English')
program3.medias.attach(io: file3, filename: "program3.jpg", content_type: "image/jpg")
user = User.where(first_name: 'Bob').first
program3.teacher = Teacher.find_by(user: user)
program3.save

file4 = URI.open("https://images.unsplash.com/photo-1506126613408-eca07ce68773?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=499&q=80")
program4 = Program.new(discipline: 'Meditation', level: 'Beginner', target: 'Stress relief and mindfulness', duration: 30, teacher_id: 4, price: 5, description: 'Introduction to stress relief and mindfulness through meditation', language: 'English')
program4.medias.attach(io: file4, filename: "program4.jpg", content_type: "image/jpg")
user = User.where(first_name: 'Clara').first
program4.teacher = Teacher.find_by(user: user)
program4.save

# Create batches
puts "Generating 2 example batches.."
batch1 = Batch.new(program: program1, start_time: "2023-03-01 10:00:00", end_time: "2023-03-01 12:00:00", max_students: 20)
batch1.save

batch2 = Batch.new(program: program2, start_time: "2023-03-02 14:00:00", end_time: "2023-03-02 16:00:00", max_students: 15)
batch2.save

# Create lessons
puts "Generating 5 example lessons ..."
lessons = [
{title: "Introduction to Yoga", description: "Learn the basics of yoga and how to breathe properly."},
{title: "Sun Salutations", description: "Practice the flowing sequence of postures to warm up your body."},
{title: "Warrior Pose", description: "Improve balance and strengthen your legs with this powerful posture."},
{title: "Tree Pose", description: "Find inner peace and focus while balancing on one foot."},
{title: "Child's Pose", description: "Relax and release tension in your back and hips with this gentle posture."}
]


5.times do |i|
lesson = Lesson.new(batch: Batch.first, number: i + 1, title: lessons[i][:title], description: lessons[i][:description])
lesson.save
end


5.times do |i|
lesson = Lesson.new(batch: Batch.last, number: i + 1, title: lessons[i][:title], description: lessons[i][:description])
lesson.save
end


puts "Finished!"
