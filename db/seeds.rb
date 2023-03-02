# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

User.destroy_all

puts "Destroying database!"

# Creating users

puts "Generating example users..."
user = User.new(
  password: 'Bob123$',
  first_name: 'Bob',
  last_name: 'Dupont',
  email: 'bob@gmail.com',
  address: '57 Rue Auber, 14150 Ouistreham',
  phone: '0123456789',
  description: "Certified Pilates instructor with a passion for helping people improve their fitness and flexibility.",
  language: "English",
  teacher: true
)
file = URI.open("https://img.huffingtonpost.com/asset/573cd81c1600002a00f93ce9.jpeg?ops=scalefit_720_noupscale")
user.profile_picture.attach(io: file, filename: "bob.jpeg", content_type: "image/jpeg")
user.save!

user = User.new(
  password: 'Clara123$',
  email: 'clara@gmail.com',
  first_name: 'Clara',
  last_name: 'Moriconi',
  address: 'rue de la montage, 67210 Obernai',
  phone: '0123456789',
  description: "New to pilates ! Hope to meet a lot of you people, online or physically!",
  language: "English"
)

file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1663345881/yaxmecvbe7skaqrm4ziw.jpg")
user.profile_picture.attach(io: file, filename: "clara.jpg", content_type: "image/jpg")
user.save!

user = User.new(
  password: 'Yamato123$',
  email: 'yamato@gmail.com',
  first_name: 'Yamato',
  last_name: 'Belhouchet',
  address: 'rue du Japon, Paris',
  phone: '0123456789',
  description: 'Experienced Yoga teacher with over 10 years of experience teaching beginners and advanced students alike.',
  language: 'English',
  teacher: true
)

file = URI.open("https://avatars.githubusercontent.com/u/113622459?v=4")
user.profile_picture.attach(io: file, filename: "yamato.jpg", content_type: "image/jpg")
user.save!

user = User.new(
  password: 'Arnaud123$',
  email: 'arnaud@gmail.com',
  first_name: 'Arnaud',
  last_name: 'Metral',
  address: 'rue de Brasilia, 72100 Le Mans',
  phone: '0123456789',
  description: 'Ohayou! Trying to progress on my meditation journey.',
  language: 'Japanese'
)

file = URI.open("https://avatars.githubusercontent.com/u/111865610?v=4")
user.profile_picture.attach(io: file, filename: "arnaud.jpg", content_type: "image/jpg")
user.save!

user = User.new(
  password: 'Kelly123$',
  email: 'kelly@gmail.com',
  first_name: 'Kelly',
  last_name: 'Kamm',
  address: 'Ocean Street, Pasadena California, USA',
  phone: '0123456789',
  description: "Kelly's classes are smart, poetic, and always a little unexpected. She is known for her storytelling and her ability to make the philosophy of yoga relatable, to bring big subjects into an every day perspective.",
  language: 'English',
  teacher: true
)

file = URI.open("https://images.yogaanytime.com/2022/01/17/vthumb_kelly-21223.jpg")
user.profile_picture.attach(io: file, filename: "kelly.jpg", content_type: "image/jpg")
user.save!

# 2 users registered to the only batch of Patanjali
user = User.new(
  password: 'Bill123$',
  email: 'bill@gmail.com',
  first_name: 'Bill',
  last_name: 'Smith',
  address: 'Ocean Street, Malibu',
  phone: '0123456789',
  description: "Beginning my yoga road.",
  language: 'English'
)

file = URI.open("https://img-0.journaldunet.com/wqqB5hyWXIRpmixAXpbZfJUVhXc=/931x/smart/206e2137b616429dbdfb0260326abcdc/ccmcms-jdn/11547842.jpg")
user.profile_picture.attach(io: file, filename: "bill.jpg", content_type: "image/jpg")
user.save!

user = User.new(
  password: 'Elon123$',
  email: 'elon@gmail.com',
  first_name: 'Elon',
  last_name: 'Grumpy',
  address: 'New York, Manhattan highest tower',
  phone: '0123456789',
  description: "Beginning my meditation road to better handle my business.",
  language: 'English'
)

file = URI.open("https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/d/9/a/d9a1058910_50163142_elon-musk1.jpg")
user.profile_picture.attach(io: file, filename: "elon.jpg", content_type: "image/jpg")
user.save!

# Creating programs
puts "Generating example programs..."
file1 = URI.open("https://www.shape.com/thmb/RpXMWyevf6dSw3-uve0Bxu18sjs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Yoga-Poses-for-Beginners-Social-GettyImages-961084648-9a458aac66a24999b57b387a8ddfd061.jpg")
program1 = Program.new(discipline: 'Yoga', level: 'Beginner', target: 'Stress relief', duration: 6, price: 300, description: 'Introducing the basics of yoga and breathing techniques to help relieve stress', language: 'English', name: 'Yoga basics for stress')
program1.medias.attach(io: file1, filename: "program1.jpg", content_type: "image/jpg")
program1.user = User.where(first_name: 'Bob').first
program1.save!

file2 = URI.open("https://wallpapercave.com/wp/wp6120255.jpg")
program2 = Program.new(discipline: 'Pilates', level: 'Intermediate', target: 'Flexibility and strength', duration: 4, price: 150, description: 'Improve flexibility and strength with Pilates', language: 'English', name: 'Pilates for strength')
program2.medias.attach(io: file2, filename: "program2.jpg", content_type: "image/jpg")
program2.user = User.where(first_name: 'Bob').first
program2.save!

file3 = URI.open("https://dance.arts.uci.edu/sites/default/files/styles/aspect_ratio_-_1920px_portrait/public/ACDA1920X1280.jpg?itok=4Kdm8F7S")
program3 = Program.new(discipline: 'Dance', level: 'Advanced', target: 'Fun and fitness', duration: 2, price: 80, description: 'Get fit and have fun with dance', language: 'English', name: 'Fun dance moves')
program3.medias.attach(io: file3, filename: "program3.jpg", content_type: "image/jpg")
program3.user = User.where(first_name: 'Bob').first
program3.save!

file4 = URI.open("https://images.unsplash.com/photo-1506126613408-eca07ce68773?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=499&q=80")
program4 = Program.new(discipline: 'Meditation', level: 'Beginner', target: 'Stress relief and mindfulness', duration: 1, price: 50, description: 'Introduction to stress relief and mindfulness through meditation', language: 'English', name: 'Have a meditaste')
program4.medias.attach(io: file4, filename: "program4.jpg", content_type: "image/jpg")
program4.user = User.where(first_name: 'Bob').first
program4.save!

program5 = Program.new(discipline: 'Yoga', level: 'Advanced', target: 'Acceptance, Relief, Courage, Inner Peace, Balance', duration: 1, price: 60,
  description: "When you let go of the need to control everything, sometimes magic happens. This cyclic class honors the rhythm and balance of light and dark through dynamic movement and gentle Yin shapes as we hear about Pan Gu and the story of creation in Chinese mythology. You will feel deeply grounded, but also light and soft.",
  language: 'English', name: 'Pan Gu')

program5.medias.attach(
  io: URI.open("https://res.cloudinary.com/dtegydg3s/image/upload/v1676284620/f8pvjkqzgfhpaqyyhcvy.png"),
  filename: 'program5_1.png',
  content_type: "image/png"
)
program5.medias.attach(
  io: URI.open("https://res.cloudinary.com/dtegydg3s/image/upload/v1676284633/rtrzzygkfrwwmgftishh.png"),
  filename: 'program5_2.png',
  content_type: "image/png"
)
program5.medias.attach(
  io: URI.open("https://res.cloudinary.com/dtegydg3s/image/upload/v1676284638/k38t7ctsm7l071n7izlz.png"),
  filename: 'program5_2.png',
  content_type: "image/png"
)
program5.user = User.where(first_name: 'Kelly').first
program5.save!

file6 = URI.open('https://www.thebostoncalendar.com/system/events/photos/000/147/102/large/Kelly_Kam_-_Robert_Sturman.jpeg?1503949846')
program6 = Program.new(discipline: 'Yoga', level: 'Intermediate', target: 'Hips, Legs', duration: 4, price: 260,
  description: "Our hearts are spacious enough to hold the agony and the ecstasy. Kelly tells the tale of the creation of Patanjali and his gift to Shiva, as we find space in the legs, hips, and side body in Anantasana, Sphinx, and Half Saddle. You will feel spacious and wholehearted.Our hearts are spacious enough to hold the agony and the ecstasy. Kelly tells the tale of the creation of Patanjali and his gift to Shiva, as we find space in the legs, hips, and side body in Anantasana, Sphinx, and Half Saddle. You will feel spacious and wholehearted.",
  language: 'English', name: 'Patanjali')
program6.medias.attach(io: file6, filename: "program6.jpg", content_type: "image/jpg")
program6.user = User.where(first_name: 'Kelly').first
program6.save!

# Create batches
puts "Generating example batches.."
batch1 = Batch.new(program: Program.first, start_time: "2023-03-01 10:00:00", end_time: "2023-08-30 9:00:00", max_students: 20)
# Generating inscription to batch for Arnaud
user = User.where(first_name: 'Arnaud').first
user.batch = batch1
batch1.save!
user.save!

batch1 = Batch.new(program: Program.first, start_time: "2023-06-01 10:00:00", end_time: "2023-11-15 12:00:00", max_students: 20)
batch1.save!

batch2 = Batch.new(program: Program.first, start_time: "2024-01-05 14:00:00", end_time: "2024-06-30 16:00:00", max_students: 15)
batch2.save!

batch3 = Batch.new(program: User.where(first_name: 'Kelly').first.programs.first, start_time: "2023-03-05 14:00:00", end_time: "2023-04-04 16:00:00", max_students: 5)
user1 = User.where(first_name: 'Bill').first
user1.batch = batch3
user2 = User.where(first_name: 'Elon').first
user2.batch = batch3
batch3.save!
user1.save!
user2.save!

batch4 = Batch.new(program: User.where(first_name: 'Kelly').first.programs.first, start_time: "2023-06-01 14:00:00", end_time: "2023-06-30 16:00:00", max_students: 15)
batch4.save!

# Add reviews to Kelly's program for demo
user = User.where(first_name: 'Arnaud').first
prg = User.where(first_name: 'Kelly').first.programs.first
review = Review.new(
  user: user,
  program: prg,
  comment: 'Very powerful teaching, Kelly is the best.',
  rating: 5
)
review.save!

# Create lessons
puts "Generating lessons for first program..."
lessons = [
{title: "Introduction to Yoga", description: "Learn the basics of yoga and how to breathe properly."},
{title: "Sun Salutations", description: "Practice the flowing sequence of postures to warm up your body."},
{title: "Warrior Pose", description: "Improve balance and strengthen your legs with this powerful posture."},
{title: "Tree Pose", description: "Find inner peace and focus while balancing on one foot."},
{title: "Child's Pose", description: "Relax and release tension in your back and hips with this gentle posture."}
]

5.times do |i|
  lesson = Lesson.new(program: Program.first, number: i + 1, title: lessons[i][:title], description: lessons[i][:description])
  lesson.save!
end

puts "Generating lessons for Kelly's programs..."
lessons = [
  { title: 'Legs', description: 'Work deeply on your legs to get a strong foundation.' },
  { title: 'Booty', description: 'Strong foundation also, between legs and upper body!' },
  { title: 'Head and neck', description: 'Relax shoulders and get a strong foundation in the upper part of your spine.' }
]

3.times do |i|
  lesson = Lesson.new(program: User.where(first_name: 'Kelly').first.programs.first, number: i + 1, title: lessons[i][:title], description: lessons[i][:description])
  lesson.save!
  batch = User.where(first_name: 'Kelly').first.programs.first.batches.first
  slot1 = Slot.create!(
    lesson: lesson,
    batch: batch,
    duration: 1,
    start_time: batch.start_time + (1..(batch.end_time.to_date - batch.start_time.to_date).to_i).to_a.sample.day,
    access_link: 'zoom.link/test'
  )
  slot2 = Slot.create!(
    lesson: lesson,
    batch: batch,
    duration: 1,
    start_time: batch.start_time + (1..(batch.end_time.to_date - batch.start_time.to_date).to_i).to_a.sample.day,
    access_link: 'zoom.link/test'
  )
  slot3 = Slot.create!(
    lesson: lesson,
    batch: batch,
    duration: 1,
    start_time: batch.start_time + (1..(batch.end_time.to_date - batch.start_time.to_date).to_i).to_a.sample.day,
    access_link: 'zoom.link/test'
  )
end

lessons = [
  { title: 'Heart', description: 'Steady your heart through meditation exercises.' },
  { title: 'Mind', description: 'Get a grip on your emotions through this work together.' },
  { title: 'Spirit', description: 'Work on a steady link between mind and body.' }
]

3.times do |i|
  lesson = Lesson.new(program: User.where(first_name: 'Kelly').first.programs.last, number: i + 1, title: lessons[i][:title], description: lessons[i][:description])
  lesson.save!
end

puts "Finished!"
