puts "Starting seeding..."
names = [
  ["George", "Tsagiannis"],
  ["Rajul", "Nail"],
  ["Debora", "Fachinello"],
  ["Gabriel", "Wilkinson"],
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
locations = [
  "Athens, Greece", "Mumbay, India", "Xanxere, Brazil", "Suffolk, UK", "Nottingham, UK",
  "London", "London, E2 8DY", "Wembley Stadium", "22 Southwark St, London SE1 0SW", "Le Wagon London"
]
names.zip(users, locations).each do |user_name_location|
  Profile.create(
    user_id: user_name_location[1].id,
    first_name: user_name_location[0][0],
    last_name: user_name_location[0][1],
    nickname: Faker::Internet.username(specifier: user_name_location[0].join(' '), separators: %w[. _ -]),
    bio: Faker::Lorem.paragraph(sentence_count: (3..6).to_a.sample),
    location: user_name_location[2]
  )
end

puts "Creating Communities..."
profiles = Profile.all.to_a
genres = Genre.all.to_a
community_local_names_location = [
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

40.times do
  genre = genres.sample.name
  location = community_local_names_location.sample
  community_name = "#{genre} #{community_last_names.sample}"
  community_description = Faker::Lorem.paragraph(sentence_count: (3..6).to_a.sample)
  community_location = location
  community_genre = Genre.find_by(name: genre).id
  community_profile = profiles.sample.id
  Community.create(
    name: community_name,
    description: community_description,
    location: community_location,
    genre_id: community_genre,
    profile_id: community_profile
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
    content: "This is the first comment of our group.
    Welcome to #{community.name}!
    Thank you for sharing your thoughts and other interesting stuff with the memebers of our community",
    likes: 0,
    community_id: community.id
  )
end

puts "Finished seeding successfully"
