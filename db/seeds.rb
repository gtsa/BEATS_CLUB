puts "Seeding started..."
names = [
  ["George", "Tsagiannis"],
  ["Rajul", "Nail"],
  ["Debora", "Fachinello"],
  ["Gabriel", "Wilkinson"],
  ["Alex", "McKenzie"]
]
100.times do
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
locations = [
  "Athens, Greece", "Mumbay, India", "Xanxere, Brazil", "Suffolk, UK", "Nottingham, UK",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London"
]

user_name_locations = names.zip(users, locations)
user_name_locations.each do |user_name_location|
  Profile.create(
    user_id: user_name_location[1].id,
    first_name: user_name_location[0][0],
    last_name: user_name_location[0][1],
    nickname: [user_name_location[0].map(&:capitalize).join, Faker::Music.chord].join('_'),
    bio: Faker::Lorem.paragraph(sentence_count: (3..6).to_a.sample),
    location: user_name_location[2]
  )
end

puts "Creating Communities..."
profiles = Profile.all.to_a
genres = Genre.all.to_a
community_locations = [
  nil, nil, nil, nil,
  "London NW1", "London W1",
  "London N1", "London NE1",
  "London E1", "London SE1",
  "London S1", "Athens 11143",
  "New Delhi", "Rio de Janeiro"
]

community_last_names = [
  "Appreciation Society",
  "ForEver",
  "Fan Club",
  "Ultras",
  "Underground Club"
]

combos = []
40.times do
  genre = genres.sample.name
  combos << [
    "#{genre} #{community_last_names.sample}",
    Faker::Lorem.paragraph(sentence_count: (3..6).to_a.sample),
    community_locations.sample,
    Genre.find_by(name: genre).id,
    profiles.sample.id
  ]
end
combos.uniq.each do |combo|
  Community.create(
    name: combo[0],
    description: combo[1],
    location: combo[2],
    genre_id: combo[3],
    profile_id: combo[4]
  )
end

puts "Adding Profiles to Communities..."
communities = Community.all.to_a
profiles.each do |profile|
  communities_list = communities.shuffle
  (4..6).to_a.sample.times do
    JoinCommunity.create(
      profile_id: profile.id,
      community_id: communities_list.pop.id
    )
  end
end

puts "Adding favourite Genres to Profiles..."
profiles.each do |profile|
  genres_list = genres.shuffle
  (2..4).to_a.sample.times do
    JoinGenre.create(
      profile_id: profile.id,
      genre_id: genres_list.pop.id
    )
  end
end

puts "Creating and adding Comments to Communities..."
communities.each do |community|
  Post.create(
    content: "This is the first comment of our group.\n
    Welcome to #{community.name}!\n
    Thank you for sharing your thoughts and other interesting stuff with the memebers of our community",
    likes: 0,
    profile_id: community.profile_id,
    community_id: community.id
  )
end

puts "Finished seeding successfully"
