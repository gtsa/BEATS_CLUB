# require "faker"

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

30.times do
  Genre.create(
    name: Faker::Music.genre
  )
end

(0..9).each do |i|
  Profile.create(
    user_id: users[i].id,
    first_name: names[i][0],
    last_name: names[i][1],
    nickname: Faker::Internet.username(specifier: names[i].join(' '), separators: %w[. _ -]),
    bio: Faker::Lorem.paragraph(sentence_count: (3..6).to_a.sample),
    location: Faker::Address.city
  )
end
