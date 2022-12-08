require "open-uri"
puts "Purging old data..."
Like.destroy_all
Post.destroy_all
JoinCommunity.destroy_all
JoinGenre.destroy_all
Community.destroy_all
Genre.destroy_all
Profile.destroy_all
User.destroy_all

# file = URI.open("https://upload.wikimedia.org/wikipedia/en/d/dd/David_Brent_111.jpg")
# profile = Profile.new(first_name: "David", last_name: "Brent", nickname: "The Brentmeister", bio: "friend first and a boss second. Probably an entertainer third.")
# profile.photo.attach(io: file, filename: "brent.png", content_type: "image/png")
# profile.save

puts "Seeding started..."

# Users
puts "Creating Users..."
names = [
  ["George", "Tsagiannis"],
  ["Rajul", "Nail"],
  ["Debora", "Fachinello"],
  ["Gabriel", "Wilkinson"],
  ["Alex", "McKenzie"]
]
5.times do
  names << [Faker::Name.first_name, Faker::Name.last_name]
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

names[5..].each_with_index do |name, index|
  User.create(
    email: "#{Faker::Internet.safe_email(name: name[0])}_#{index}",
    password: Faker::Internet.password(min_length: 8)
  )
end

users = User.all

# Genres
puts "Creating Genres..."

genre_names = [
  "Electronic",
  "Rock",
  "Pop",
  "Classical",
  "Hip Hop",
  "Funk",
  "Rap",
  "Jazz",
  "Rock",
  "Reggae",
  "Latin"
]

genre_names.each { |name| Genre.create(name: name) }

# Profiles
puts "Creating Profiles..."

avatars = [
  "https://i.pinimg.com/564x/29/5e/6b/295e6b42a9d57dfbc84a8dec71ae5c92.jpg",
  "https://img.freepik.com/premium-vector/retro-audio-cassette-hand-drawn-pop-art-style-illustration_6947-383.jpg",
  "https://i.pinimg.com/564x/af/d1/68/afd1682d1477453361dcd10953629cf9.jpg",
  "https://i.pinimg.com/564x/13/f3/5d/13f35d551b3cb3aeb3a6aedf9b2febfe.jpg",
  "https://www.jos-coufreur.com/media/com_eshop/products/resized/Jimi%20Hendrix%2090x120cm%20copy-600x600.jpg",
  "http://ih0.redbubble.net/image.11681653.5012/flat,550x550,075,t.u4.jpg",
  "https://i.pinimg.com/564x/68/47/62/6847623b38d301e6edf9d64cc38ca4c0.jpg",
  "https://img.buzzfeed.com/buzzfeed-static/static/2016-01/11/13/enhanced/webdr07/enhanced-23941-1452538241-7.jpg",
  "https://64.media.tumblr.com/55a961641399929069ca594fd0bfd331/tumblr_ploof2Cw4z1qds0n0o1_1280.jpg",
  "https://i.pinimg.com/564x/93/51/8e/93518e3b2ec04aaeab316a6a16242c86.jpg"
]
names.each_with_index do |name, index|
  file = URI.open(avatars[index])
  profile = Profile.new(
    first_name: name.first,
    last_name: name.last,
    nickname: [name.map(&:capitalize).join, Faker::Music.chord].join,
    bio: "Hi I'm #{name.first}. I love music. I prefer Rock music. My favourite artist is David Bowie",
    location: "London, UK",
    user_id: index + 1
  )
  profile.photo.attach(io: file, filename: "avatar.png", content_type: "image/png")
  profile.save
end

# Communities
puts "Creating Communities..."

t = 0
# Community 01
file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Transmission_Prague_2018.jpg/1200px-Transmission_Prague_2018.jpg")
community = Community.new(
  name: "Electronic Fan Club",
  description: "placeholder",
  location: "32 Richmond Road BRADFORD BD70 9DU",
  genre: Genre.find_by(name: "Electronic"),
  profile_id: 1
)
community.photo.attach(io: file, filename: "club.png", content_type: "image/png")
community.save

# Community 02
file = URI.open("https://images.prismic.io/soundcharts/9b20aa4fe11af1b0a64c79dcf4f0c066449a7df6_artists-audience-band-1763075.jpg")
community = Community.new(
  name:  "Rock Ultras",
  description: "A club for rock lovers! post your favourite bands and songs on here. We meet every Friday at the Shacklewell arms for a live band night, where local rock artists play their sets.",
  location: "5 Mill Road London N95 1XY",
  genre: Genre.find_by(name: "Rock"),
  profile_id: 2
)
community.photo.attach(io: file, filename: "club.png", content_type: "image/png")
community.save

# Community 03
file = URI.open("https://www.billboard.com/wp-content/uploads/media/pop-streaming-photo-illo-bb30-yim-2019-billboard-1500.jpg")
community = Community.new(
  name: "Pop Club",
  description:"placeholder",
  location: "EC12 3XJ",
  genre: Genre.find_by(name: "Pop"),
  profile_id: 3
)
community.photo.attach(io: file, filename: "club.png", content_type: "image/png")
community.save

# Community 04
file = URI.open("https://www.francetvinfo.fr/pictures/5YP2zgYoGNX9mwgWAGLiNSTpnQs/111x0:1889x1000/944x531/filters:format(webp)/2019/04/11/orchestrenuitdeboutok.jpg")
community = Community.new(
  name: "Classical Society",
  description:"placeholder",
  location: "72 South Street London NW12 8FU",
  genre: Genre.find_by(name: "Classical"),
  profile_id: 4
)
community.photo.attach(io: file, filename: "club.png", content_type: "image/png")
community.save

# Community 05
file = URI.open("https://cdn11.bigcommerce.com/s-yzgoj/images/stencil/1280x1280/products/1137145/3910084/apimt4tf4__03852.1626445937.jpg?c=2")
community = Community.new(
  name: "Hip Hop Fan Club",
  description:"placeholder",
  location: "N76 9YQ",
  genre: Genre.find_by(name: "Hip Hop"),
  profile_id: 5
)
community.photo.attach(io: file, filename: "club.png", content_type: "image/png")
community.save

# Community 06
file = URI.open("https://assets-cdn.audionetwork.com/templates/images/Image_10468_98_20482616.png")
community = Community.new(
  name: "Latin Fan Club",
  description:"placeholder",
  location: "792 Alexander Road London WC61 3MG",
  genre: Genre.find_by(name: "Latin"),
  profile_id: 6
)
community.photo.attach(io: file, filename: "club.png", content_type: "image/png")
community.save

# Community 07
file = URI.open("https://st2.depositphotos.com/1030362/5337/v/950/depositphotos_53371697-stock-illustration-cannabis-leaf-on-grunge-rastafarian.jpg")
community = Community.new(
  name: "Reggae Party",
  description:"placeholder",
  location: "NW52 6QG",
  genre: Genre.find_by(name: "Reggae"),
  profile_id: 7
)
community.photo.attach(io: file, filename: "club.png", content_type: "image/png")
community.save

# Community 08
file = URI.open("https://www.nanalyze.com/app/uploads/2018/05/AI-Generated-Music-Teaser.jpg.webp")
community = Community.new(
  name: "Rockers",
  description:"placeholder",
  location: "25 The Grove London SW07 6PZ",
  genre: Genre.find_by(name: "Rock"),
  profile_id: 8
)
community.photo.attach(io: file, filename: "club.png", content_type: "image/png")
community.save

# Community 09
file = URI.open("https://www.cmuse.org/wp-content/uploads/2020/07/Characteristics-of-Funk-Music.jpg")
community = Community.new(
  name: "Funk Fan Club",
  description:"placeholder",
  location: "TQ80 1UC",
  genre: Genre.find_by(name: "Funk"),
  profile_id: 9
)
community.photo.attach(io: file, filename: "club.png", content_type: "image/png")
community.save

# Community 10
file = URI.open("https://factmag-images.s3.amazonaws.com/wp-content/uploads/2013/03/UZ-mixtape3.1.2013-1.jpg")
community = Community.new(
  name: "Rap Underground Club",
  description:"placeholder",
  location: "78 North Road COVENTRY CV75 1ZC",
  genre: Genre.find_by(name: "Rap"),
  profile_id: 10
)
community.photo.attach(io: file, filename: "club.png", content_type: "image/png")
community.save

# Community 11
file = URI.open("https://www.pngitem.com/pimgs/m/63-637683_banner-transparent-orchestra-conductor-dance-silhouette-jazz-big.png")
community = Community.new(
  name: "Jazz Appreciation Society",
  description: "Welcome to the Jazz Appreciation Society - bio tbc",
  location: "W91 1ZC",
  genre: Genre.find_by(name: "Jazz"),
  profile_id: 1
)
community.photo.attach(io: file, filename: "club.png", content_type: "image/png")
community.save

puts "Adding Profiles to Communities..."
JoinCommunity.create(
  profile_id: 1,
  community_id: 2
)
JoinCommunity.create(
  profile_id: 2,
  community_id: 2
)
JoinCommunity.create(
  profile_id: 3,
  community_id: 2
)
JoinCommunity.create(
  profile_id: 4,
  community_id: 2
)
JoinCommunity.create(
  profile_id: 5,
  community_id: 2
)
JoinCommunity.create(
  profile_id: 6,
  community_id: 2
)
JoinCommunity.create(
  profile_id: 7,
  community_id: 2
)
JoinCommunity.create(
  profile_id: 8,
  community_id: 2
)
JoinCommunity.create(
  profile_id: 9,
  community_id: 2
)
JoinCommunity.create(
  profile_id: 10,
  community_id: 2
)

JoinCommunity.create(
  profile_id: 1,
  community_id: 11
)
JoinCommunity.create(
  profile_id: 2,
  community_id: 11
)
JoinCommunity.create(
  profile_id: 3,
  community_id: 11
)
JoinCommunity.create(
  profile_id: 4,
  community_id: 11
)
JoinCommunity.create(
  profile_id: 5,
  community_id: 11
)
JoinCommunity.create(
  profile_id: 6,
  community_id: 11
)
JoinCommunity.create(
  profile_id: 7,
  community_id: 11
)
JoinCommunity.create(
  profile_id: 8,
  community_id: 11
)
JoinCommunity.create(
  profile_id: 9,
  community_id: 11
)
JoinCommunity.create(
  profile_id: 10,
  community_id: 11
)

puts "Adding favourite Genres to Profiles..."
genres = Genre.all
profiles = Profile.all.to_a
profiles.each do |profile|
  genres_list = genres.shuffle
  (2..4).to_a.sample.times do
    JoinGenre.create(
      profile_id: profile.id,
      genre_id: genres_list.pop.id
    )
  end
end

# Posts
puts "Creating and adding Posts to Communities..."

# Rock Club
file = URI.open("https://media.pitchfork.com/photos/62dd3b7e4e5e79e85598914b/1:1/w_320,c_limit/Red-Hot-Chili-Peppers-Return-of-the-Dream-Canteen.jpg")
post = Post.new(
  content: "Has anyone listened to the new RHCP album? I personally love the song Bella!",
  profile_id: 7,
  community_id: 2,
  title: "The first comment of our club"
)
post.photo.attach(io: file, filename: "post.png", content_type: "image/png")
post.save

file = URI.open("https://i1.sndcdn.com/avatars-wJw5PgqacM7DDwjz-5HjJVg-t500x500.jpg")
post = Post.new(
  content: "I found out who that amazing band are who were playing in the Shacklewell arms! Here is some more info on them! https://www.wearepalace.com/",
  profile_id: 8,
  community_id: 2
)
post.photo.attach(io: file, filename: "post.png", content_type: "image/png")
post.save


file = URI.open("https://louderthanwar.com/wp-content/uploads/2022/10/King-Gizzard-The-Lizard-Wizard-scaled.jpg")
post = Post.new(
  content: "Is anyone going to the King Gizzard and the Lizard Wizard gig at 02 Academy, Brixton next Tuesday? My mate can't go anymore :(",
  profile_id: 7,
  community_id: 2
)
post.photo.attach(io: file, filename: "post.png", content_type: "image/png")
post.save

# Jazz Club
file = URI.open("https://www.funkgurus.com/photos/artists/275310758_381394330125184_9111657772803782807_n_6085e_lg.jpg")
post = Post.new(
  content: "can't wait for us to go see Patrick Hayes' Crusaders at Ronnie Scott's next Saturday - tickets are still on sale if anyone fancies joining! https://www.ronniescotts.co.uk/performances/view/7911-late-late-show-with-patrick-hayes-crusaders",
  profile_id: 7,
  community_id: 11
)
post.photo.attach(io: file, filename: "post.png", content_type: "image/png")
post.save

file = URI.open("https://cdn.pixabay.com/photo/2022/02/15/00/42/music-7014127__340.jpg")
post = Post.new(
  content: "Hey guys, just found an awesome website with a calendar of all the places showing jazz this year! Check it out ==> http://jazzin.london/",
  profile_id: 9,
  community_id: 11
)
post.photo.attach(io: file, filename: "post.png", content_type: "image/png")
post.save

puts "Liking Posts..."

Like.create(
  profile_id: 8,
  post_id: 1
)

Like.create(
  profile_id: 9,
  post_id: 1
)
Like.create(
  profile_id: 10,
  post_id: 1
)
Like.create(
  profile_id: 7,
  post_id: 1
)
Like.create(
  profile_id: 6,
  post_id: 1
)

Like.create(
  profile_id: 8,
  post_id: 1
)

Like.create(
  profile_id: 9,
  post_id: 2
)
Like.create(
  profile_id: 10,
  post_id: 2
)

puts "Seeding finished successfully"
