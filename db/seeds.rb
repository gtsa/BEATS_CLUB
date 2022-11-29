puts "Starting seeding..."
names = [
  ["George", "Tsagiannis"],
  ["Rajul", "Nail"],
  ["Debora", "Faccinello"],
  ["Gabriel","Wilkinson"],
  ["Alex", "McKenzie"]
]
5.times do
  names << [Faker::Name.first_name, Faker::Name.last_name  ]
end

puts "Creating Users..."

# user_tester_george
User.create(email: 'george@email.com', password: '111111')
# user_tester_rajul
User.create(email: 'rajul@email.com', password: '111111')
# user_tester_debora
User.create(email: 'debora@email.com', password: '111111')
# user_tester_gabriel
User.create(email: 'gabriel@email.com', password: '111111')
# user_tester_alex
User.create(email: 'alex@email.com', password: '111111')

names[5..].each do |name|
  User.create(
    email: Faker::Internet.safe_email(name: name[0]),
    password: Faker::Internet.password(min_length: 8)
  )
end

users = User.all.to_a

puts "Creating Genres..."
genres = []
100.times do
  genres << Faker::Music.genre
end
genres.uniq.each do |genre|
  Genre.create(
    name: genre
  )
end

puts "Creating Profiles..."
names.zip(users).each do |name_user|
  Profile.create(
    user_id: name_user[1].id,
    first_name: name_user[0][0],
    last_name: name_user[0][1],
    nickname: Faker::Internet.username(specifier: name_user[0].join(' '), separators: %w[. _ -]),
    bio: Faker::Lorem.paragraph(sentence_count: (3..6).to_a.sample),
    location: Faker::Address.city
  )
end

puts "Finished seeding successfully"
