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
100.times do
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
  "Hip-Hop",
  "Latin",
  "Soul",
  "Reggae",
  "Blues",
  "Soundtracks",
  "K-pop",
  "Funk",
  "Rap",
  "Jazz",
  "World",
  "Techno",
  "Trap",
  "Country"
]

genre_names.each do |name|
  Genre.create(
    name:
  )
end

# Profiles
puts "Creating Profiles..."

profiles_locations = [
  "Athens, Greece", "Mumbay, India", "Xanxere, Brazil", "SufK-pop, UK", "Nottingham, UK",
  "London N22 7UB", "London W4 5BD", "London SW17 8PY", "London SE9 4PG", "London SW6 3SN",
  "London NW11 6EU", "London E2 0NL", "London E17 3JQ", "London NW10 5LJ", "London E14 8LE",
  "London NW10 2BS", "London SE15 1QQ", "London NW11 0QX", "London E14 4BW", "London NW1 4QE",
  "London SE5 0NJ", "London SW11 8BY", "London N2 9NN", "London E14 9BS", "London N14 4NP",
  "9726 York Road HUDDERSFIELD HD6 3BH", "1 Church Lane LERWICK ZE49 3VY",
  "53 The Grove NEWPORT NP50 2EY", "1 Park Road FALKIRK FK73 3DR",
  "69 West Street DORCHESTER DT53 1JR", "75 Queensway SWINDON SN33 3TD",
  "17 London Road KINGSTON UPON THAMES KT15 8CZ", "88 Church Road STOKE-ON-TRENT ST41 8CT",
  "16 High Street DARTFORD DA71 3CY", "18 Park Lane GLOUCESTER GL48 2FA",
  "117 Richmond Road WESTERN CENTRAL LONDON WC21 8XY", "7 Stanley Road STOCKPORT SK36 4VE",
  "59 Grove Road NORTH WEST LONDON NW59 3XV", "77 Queen Street TELFORD TF18 0YW",
  "40 Queens Road PRESTON PR9 3HF", "747 Springfield Road HARROGATE HG48 0KA",
  "97 Highfield Road CAMBRIDGE CB81 7KY", "781 Mill Road SWANSEA SA18 1OR",
  "47 The Green CARDIFF CF46 7ZE", "70 King Street INVERNESS IV35 2BA",
  "11, Klein Kubbelkow-Dorfstraße, Sehlen, Vorpommern-Rügen, Mecklenburg-Vorpommern, 18528, Deutschland",
  "12, Wallenschwil, Beinwil (Freiamt), Bezirk Muri, Aargau, 5637, Switzerland",
  "50, Nybohovsbacken, Nybohov, Gröndal, Stockholm, Stockholm County, 117 64, Sweden",
  "17, Camiono de Santiago, Andalucía, 41210, España",
  "Baptista Templom, 43, Kinizsi utca, Minta lakótelep, Szigetszentmiklós, Pest, 2310, Hungary",
  "122, Strada Vilan, Grătiești Commune, Moldova",
  "3, Prazka Street, Dniprovskyi district, Kyiv, 02090, Ukraine",
  "5, Moseragratstrasse, Obersimmental-Saanen administrative district, Bern, 1657, Switzerland",
  "279, Mosseveien, Fiskevollen, Nordstrand, Oslo, 1169, Norway",
  "2А, Zavoy, kv.Benkovski, Sofia, Sofia-City, 1278, Bulgaria",
  "17630 SE 90th St, Ocklawaha, Florida(FL), 32179(410) 701-7507",
  "3523 Cabot Rd Randallstown, Maryland(MD), 21133(740) 928-2329",
  "130 Broadway St, Hebron, Ohio(OH), 43025(304) 369-0235",
  "3150 Cox Rd, Danville, West Virginia(WV), 25053(701) 797-2495",
  "904 Lenham Ave SE, Cooperstown, North Dakota(ND), 58425",
  "2489 9th Ave, Lethbridge, Alberta(AB), T1J 2J7",
  "4963 Queen Elizabeth Boulevard, Etobicoke, Ontario(ON), M8Z 1M3",
  "3362 Rogers Road, Toronto, Ontario(ON), M6E 1R1",
  "EJE 8 NO. 256, LA MAGDALENA, 75650, México",
  "VALLEJO 1110 NO. DEPTO 306, PRADO VALLEJO, 54170, México",
  "San Pedro 402, Santa Rosa, La Pampa, Argentina",
  "Avenida San Martin 1256, Caseros, Buenos Aires, Argentina",
  "Av. 38 1313 Barrio Norte, La Plata, Buenos Aires, Argentina",
  "Travessa João Evangelista 1229, Feira De Santana, Bahia, 44085-050, Brazil",
  "Rua Cristovão Ferreira 767, Salvador, Bahia, 41207-105, Brazil",
  "Rua do Alecrim 5, Serra, Espírito Santo, 29177-183, Brazil",
  "Calle San Ignacio, 549, X Región, Puerto Montt, Chile",
  "Calle Membrillar, 851, VII Región, Curicó, Chile",
  "El Caney, Santiago De Cuba, Cuba",
  "AV. LAS INDUSTRIAS, Palo Verde, Caracas, Venezuela",
  "Ibadan, Nigeria", "Abuja, Nigeria", "Kumasi, Ghana", "Khartoum, Sudan", "Dar es Salaam, Tanzania",
  "Antananarivo, Madagascar", "Cape Town, South Africa", "Niamey, Niger", "Bamako, Mali", "Windhoek, Namibia",
  "Taipei", "Kuala Lumpur", "Tehran", "Seoul", "Kolkata", "Bengaluru", "Guangzhou", "Hanoi",
  "Nanjing", "New Delhi", "Phnom Penh", "Shenzhen", "Baghdad", "Bangkok", "Dhaka", "Mumbai",
  "Christchurch", "Palikir", "Nukuʻalofa", "Darwin"
]

bio_parts = [
  "Troublemaker", "Beer lover", "Coffee nerd", "Music buff", "Twitter geek",
  "Hardcore web fanatic", "Communicator", "Troublemaker", "Falls down a lot",
  "Analyst", "Alcoholaholic", "Organizer", "Extreme internet advocate",
  "Explorer", "Problem solver", "Twitter fanatic", "Beer specialist",
  "Proud creator", "Bacon geek", "Student", "Extreme tv guru", "Alcohol ninja",
  "Internet expert", "Food fan", "Communicator", "Bacon fanatic",
  "Internet trailblazer", "Entrepreneur", "Travel advocate", "Organizer",
  "Passionate communicator", "Subtly charming thinker", "Twitter expert",
  "Problem solver", "Amateur tv lover", "Organizer", "Bacon ninja", "Reader",
  "Friendly web evangelist", "Certified music specialist", "Devoted gamer",
  "Thinker", "Unapologetic tv fanatic", "Baconaholic",
  "Infuriatingly humble twitter aficionado", "Social media advocate",
  "Zombie maven", "Creator", "Coffee enthusiast", "Travelaholic", "Beer fanatic",
  "Web nerd", "Internet advocate", "Analyst", "Organizer", "Zombie expert",
  "Incurable communicator", "Travel enthusiast", "Alcohol trailblazer",
  "Travel guru", "Entrepreneur", "Alcohol aficionado", "Gamer", "Unapologetic tv lover",
  "Twitter junkie", "Extreme introvert", "Incurable social media enthusiast",
  "Troublemaker", "Wannabe travel fanatic", "Bacon scholar", "Tv maven",
  "Pop culture guru", "Explorer", "Food ninja", "Twitter fanatic", "Internet specialist",
  "Music practitioner", "Twitteraholic", "Pop culture enthusiast", "Social media geek",
  "Passionate gamer", "Introvert", "Hipster-friendly student", "Bacon expert", "Tv buff",
  "Subtly charming reader", "Devoted pop culture advocate", "Certified analyst", "Troublemaker",
  "Unapologetic internetaholic", "Typical explorer", "Proud beer practitioner",
  "Amateur entrepreneur", "Music aficionado", "Bacon evangelist", "Zombie fanatic",
  "Coffee junkie", "Travel maven", "Twitter trailblazer", "Student", "Alcohol buff",
  "Reader", "Coffee ninja", "Tv expert", "Web fanatic", "Bacon evangelist",
  "Unapologetic food maven", "Travel practitioner", "Student", "Beer guru",
  "Baconaholic", "Amateur organizer", "Thinker", "Subtly charming twitter evangelist",
  "Proud travel fan", "Beer ninja", "Hipster-friendly pop culture guru", "Introvert",
  "Wannabe internet evangelist", "Food scholar", "Friendly entrepreneur", "Explorer",
  "Bacon junkie", "Internet buff", "Freelance thinker", "Web guru", "Pop culture lover",
  "Food fanatic", "Twitter scholar", "Alcohol evangelist", "Zombie junkie", "Problem solver",
  "Web expert", "Subtly charming beer fanatic", "Pop cultureaholic", "Creator",
  "Zombie junkie", "Extreme twitter advocate", "Travel fan"
]

profiles_locations.each_with_index do |location, index|
  file = URI.open(Faker::Avatar.image)
  profile = Profile.new(
    first_name: names[index].first,
    last_name: names[index].last,
    nickname: [names[index].map(&:capitalize).join, Faker::Music.chord].join,
    bio: bio_parts.sample(rand(8..10)).shuffle.join('. '),
    location:,
    user_id: index + 1
  )
  profile.photo.attach(io: file, filename: "avatar_user_#{index + 1}.png", content_type: "image/png")
  profile.save
end

# Communities
puts "Creating Communities..."

communities_names = [
  "Electronic Fan Club",
  "Rock Ultras",
  "Pop Club",
  "Classical Society",
  "Hip-Hop Fan Club",
  "Latin Fan Club",
  "Soul ForEver",
  "Reggae Ultras",
  "Rock ers",
  "Electronic Ultras",
  "Blues Underground Club",
  "Soundtracks Fan Club",
  "K-pop Ultras",
  "Funk Fan Club",
  "Rap Underground Club",
  "Jazz Appreciation Society",
  "Classical Underground Club",
  "Soul Fan Club",
  "World ForEver",
  "Blues Ultras",
  "Techno Underground Club",
  "Trap Appreciation Society",
  "Latin Underground Club",
  "World Underground Club",
  "Reggae Appreciation Society",
  "Hip-Hop Ultras",
  "Soul Ultras",
  "Hip-Hop Underground Club",
  "Trap Ultras",
  "Electronic Appreciation Society",
  "Jazz ForEver",
  "Rock Underground Club",
  "Pop Fan Club",
  "Country Ultras",
  "Reggae Fan Club",
  "Blues Appreciation Society"
]

commmunities_photo_url = [
  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Transmission_Prague_2018.jpg/1200px-Transmission_Prague_2018.jpg",
  "https://images.prismic.io/soundcharts/9b20aa4fe11af1b0a64c79dcf4f0c066449a7df6_artists-audience-band-1763075.jpg",
  "https://www.billboard.com/wp-content/uploads/media/pop-streaming-photo-illo-bb30-yim-2019-billboard-1500.jpg",
  "https://www.francetvinfo.fr/pictures/5YP2zgYoGNX9mwgWAGLiNSTpnQs/111x0:1889x1000/944x531/filters:format(webp)/2019/04/11/orchestrenuitdeboutok.jpg",
  "https://cdn11.bigcommerce.com/s-yzgoj/images/stencil/1280x1280/products/1137145/3910084/apimt4tf4__03852.1626445937.jpg?c=2",
  "https://assets-cdn.audionetwork.com/templates/images/Image_10468_98_20482616.png",
  "https://www.cyberprmusic.com/wp-content/uploads/2021/02/pasted-image-0-5.png",
  "https://st2.depositphotos.com/1030362/5337/v/950/depositphotos_53371697-stock-illustration-cannabis-leaf-on-grunge-rastafarian.jpg",
  "https://www.nanalyze.com/app/uploads/2018/05/AI-Generated-Music-Teaser.jpg.webp",
  "https://www.tpimagazine.com/wp-content/uploads/2022/01/Gerry_Cinnamon_Q338.jpg",
  "https://www.googobits.com/wp-content/uploads/2018/06/blues-music.jpg",
  "https://i0.wp.com/www.biblestudynote.com/wp-content/uploads/2018/01/musicvideo-banner.jpg",
  "https://mir-s3-cdn-cf.behance.net/project_modules/1400/7018cf77192645.5c80447b1edab.jpg",
  "https://www.cmuse.org/wp-content/uploads/2020/07/Characteristics-of-Funk-Music.jpg",
  "https://factmag-images.s3.amazonaws.com/wp-content/uploads/2013/03/UZ-mixtape3.1.2013-1.jpg",
  "https://www.pngitem.com/pimgs/m/63-637683_banner-transparent-orchestra-conductor-dance-silhouette-jazz-big.png",
  "https://miro.medium.com/max/1024/1*mixpt3aTomNCPC2-cBlmIw.jpeg",
  "https://images.unsplash.com/photo-1502710655568-ee441b74b0b9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c291bCUyMG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
  "https://i.ytimg.com/vi/VSX1xbrLzgk/maxresdefault.jpg",
  "https://mcdn.wallpapersafari.com/medium/41/76/CrLGje.jpg",
  "https://img.freepik.com/premium-photo/happy-people-dance-nightclub-party-concert_31965-11254.jpg",
  "https://www.billboard.com/wp-content/uploads/2016/10/Flosstradamus-press-billboard-1548.jpg",
  "https://img.freepik.com/free-vector/latin-music-band-illustration_23-2149577191.jpg",
  "https://cdn.shopify.com/s/files/1/1619/7281/files/2_2d5530da-1be2-49bc-ac97-06cf4d5e140b.png",
  "https://static.vecteezy.com/system/resources/previews/009/334/261/large_2x/jamaica-reggae-bundle-set-background-red-yellow-and-green-free-vector.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/B-boy_breakdancing.jpg/1200px-B-boy_breakdancing.jpg",
  "http://www.funku.fr/wp-content/uploads/2014/04/Best-of-Soul-Music-500x350.jpg",
  "https://www.kennedy-center.org/globalassets/education/resources-for-educators/classroom-resources/artsedge/media/hip-hop-a-culture-of-vision-and-voice/hip-hop-169.jpg",
  "https://i.ytimg.com/vi/wpAs4GHNsdA/sddefault.jpg",
  "https://assets-cdn.audionetwork.com/templates/images/Image_12724_98.png",
  "https://upload.wikimedia.org/wikivoyage/en/a/ab/Jazz_DOTM_Banner_1.jpg",
  "https://blog.discmakers.com/wp-content/uploads/2018/03/RockStar_Facebook.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwm30nGjx2oziWNh2qyL_u62uDRTkb5iBo8w&usqp=CAU",
  "https://grizzlyrose.com/wp-content/uploads/2016/05/Birthplace-of-Country-Music.jpg",
  "https://m.media-amazon.com/images/I/61ZCriwhauL._AC_SL1000_.jpg",
  "http://www.thecontrarianmedia.com/wp-content/uploads/2011/04/blues.jpg"
]

communities_descriptions = [
  "Electronic Fan Club is on the edge of your mind. Songs from our time at S.U.
  There will have to be something to this; there were also music references that I'd forgotten about,
  so let's give one more of my favorites and let's begin by highlighting the 'myloves'.",
  "The Rock Ultras are unique in one possible reason. Rock Ultras are essentially the lower section of the Ultras
  that is most likely to be moved in order to place them in the wall. The rocks can, in some cases, be rotated to form
  up to a fixed size on the rock. It's almost exactly what the Turtle Rock Ultras have done when they were added to the
  wall as they sit on top of the wall.",
  "Pop Club's official website has been pulled from its website. As part of that, the site has been removed,
  which is the same method that was used to create the website's homepage at the start of this story.
  We can only take this as an opportunity to take a closer look at the fact that Underground Club has had a long history. ",
  "Classical Society, where your songs have to be sung to make sense, instead of relying purely on music notation to help you
  plan those kinds of songs. You've got really great musical notation and an extremely strong sense of narrative purpose.
  The more you spend and spend time on those basic ideas and processes, the more easily you may be able to plan those musical ideas.
  And it is amazing how far that can go for an individual artist.",
  "Hip Hop Fan Club. There is lots of beer in there. The bar is a great place to hang out with my friends. I can sit on the back of
  the bar and have a good time with my boyfriend. I like the sound system in this. The staff is great and the bar has an upstairs area.
  The ambiance and smell are quite good. I've always enjoyed drinking so far. I love the atmosphere.",
  "Latin Fan Club, of which we were in business before we took over the club, will stand to gain in value and be able to continue
  to serve our great parts. That said, there have been few other clubs that appear to be looking to shift into the Leafs' new ownership
  and have more of a stake in their long and successful history.",
  "Soul ForEver is on the edge of your mind. Songs from our time at S.U.
  There will have to be something to this; there were also music references that I'd forgotten about,
  so let's give one more of my favorites and let's begin by highlighting the 'myloves'.",
  "The Reggae Ultras are unique in one possible reason. Reggae Ultras are essentially the lower section of the Ultras
  that is most likely to be moved in order to place them in the wall. The rocks can, in some cases, be rotated to form
  up to a fixed size on the rock. It's almost exactly what the Turtle Reggae Ultras have done when they were added to the
  wall as they sit on top of the wall.",
  "Rockers' official website has been pulled from its website. As part of that, the site has been removed,
  which is the same method that was used to create the website's homepage at the start of this story.
  We can only take this as an opportunity to take a closer look at the fact that Tockers' Club has had a long history. ",
  "Electronic Ultras, where your songs have to be sung to make sense, instead of relying purely on music notation to help you
  plan those kinds of songs. You've got really great musical notation and an extremely strong sense of narrative purpose.
  The more you spend and spend time on those basic ideas and processes, the more easily you may be able to plan those musical ideas.
  And it is amazing how far that can go for an individual artist.",
  "Blues Underground Club: There is lots of beer in there. The bar is a great place to hang out with my friends. I can sit on the back of
  the bar and have a good time with my boyfriend. I like the sound system in this. The staff is great and the bar has an upstairs area.
  The ambiance and smell are quite good. I've always enjoyed drinking so far. I love the atmosphere.",
  "Classical Underground Club, of which we were in business before we took over the club, will stand to gain in value and be able to continue
  to serve our great parts. That said, there have been few other clubs that appear to be looking to shift into the Leafs' new ownership
  and have more of a stake in their long and successful history.",
  "K-pop Ultras are on the edge of your mind. Songs from our time at S.U.
  There will have to be something to this; there were also music references that I'd forgotten about,
  so let's give one more of my favorites and let's begin by highlighting the 'myloves'.",
  "Funk Fan Club's official website has been pulled from its website. As part of that, the site has been removed,
  which is the same method that was used to create the website's homepage at the start of this story.
  We can only take this as an opportunity to take a closer look at the fact that Underground Club has had a long history. ",
  "Rap Underground Club, where your songs have to be sung to make sense, instead of relying purely on music notation to help you
  plan those kinds of songs. You've got really great musical notation and an extremely strong sense of narrative purpose.
  The more you spend and spend time on those basic ideas and processes, the more easily you may be able to plan those musical ideas.
  And it is amazing how far that can go for an individual artist.",
  "Jazz Appreciation Society. There is lots of beer in there. The bar is a great place to hang out with my friends. I can sit on the back of
  the bar and have a good time with my boyfriend. I like the sound system in this. The staff is great and the bar has an upstairs area.
  The ambiance and smell are quite good. I've always enjoyed drinking so far. I love the atmosphere.",
  "Classical Underground Club, of which we were in business before we took over the club, will stand to gain in value and be able to continue
  to serve our great parts. That said, there have been few other clubs that appear to be looking to shift into the Leafs' new ownership
  and have more of a stake in their long and successful history.",
  "Soul Fan Club are unique in one possible reason. Soul Fan Club is essentially the lower section of the Ultras
  that is most likely to be moved in order to place them in the wall. The rocks can, in some cases, be rotated to form
  up to a fixed size on the rock. It's almost exactly what the Turtle Soul Ultras have done when they were added to the
  wall as they sit on top of the wall.",
  "World ForEver is on the edge of your mind. Songs from our time at S.U.
  There will have to be something to this; there were also music references that I'd forgotten about,
  so let's give one more of my favorites and let's begin by highlighting the 'myloves'.",
  "Blues Ultras are unique in one possible reason. Blues Ultras are essentially the lower section of the Ultras
  that is most likely to be moved in order to place them in the wall. The blues can, in some cases, be rotated to form
  up to a fixed size on the blue. It's almost exactly what the Turtle Blue Ultras have done when they were added to the
  wall as they sit on top of the wall.",
  "Techno Underground Club's official website has been pulled from its website. As part of that, the site has been removed,
  which is the same method that was used to create the website's homepage at the start of this story.
  We can only take this as an opportunity to take a closer look at the fact that Techno Underground Club has had a long history. ",
  "Trap Appreciation Society, where your songs have to be sung to make sense, instead of relying purely on music notation to help you
  plan those kinds of songs. You've got really great musical notation and an extremely strong sense of narrative purpose.
  The more you spend and spend time on those basic ideas and processes, the more easily you may be able to plan those musical ideas.
  And it is amazing how far that can go for an individual artist.",
  "Latin Underground Club: There is lots of beer in there. The bar is a great place to hang out with my friends. I can sit on the back of
  the bar and have a good time with my boyfriend. I like the sound system in this. The staff is great and the bar has an upstairs area.
  The ambiance and smell are quite good. I've always enjoyed drinking so far. I love the atmosphere.",
  "World Underground Club, of which we were in business before we took over the club, will stand to gain in value and be able to continue
  to serve our great parts. That said, there have been few other clubs that appear to be looking to shift into the Leafs' new ownership
  and have more of a stake in their long and successful history.",
  "Reggae Appreciation Society is on the edge of your mind. Songs from our time at S.U.
  There will have to be something to this; there were also music references that I'd forgotten about,
  so let's give one more of my favorites and let's begin by highlighting the 'myloves'.",
  "The Hip-Hop Ultras are unique in one possible reason. Hip-Hop Ultras are essentially the lower section of the Ultras
  that is most likely to be moved in order to place them in the wall. The rocks can, in some cases, be rotated to form
  up to a fixed size on the rock. It's almost exactly what the Turtle Hip-Hop Ultras have done when they were added to the
  wall as they sit on top of the wall.",
  "Soul Ultras' official website has been pulled from its website. As part of that, the site has been removed,
  which is the same method that was used to create the website's homepage at the start of this story.
  We can only take this as an opportunity to take a closer look at the fact that Underground Club has had a long history. ",
  "Hip-Hop Underground Club, where your songs have to be sung to make sense, instead of relying purely on music notation to help you
  plan those kinds of songs. You've got really great musical notation and an extremely strong sense of narrative purpose.
  The more you spend and spend time on those basic ideas and processes, the more easily you may be able to plan those musical ideas.
  And it is amazing how far that can go for an individual artist.",
  "Trap Ultras: There is lots of beer in there. The bar is a great place to hang out with my friends. I can sit on the back of
  the bar and have a good time with my boyfriend. I like the sound system in this. The staff is great and the bar has an upstairs area.
  The ambiance and smell are quite good. I've always enjoyed drinking so far. I love the atmosphere.",
  "Electronic Appreciation Society, of which we were in business before we took over the club, will stand to gain in value and be able to continue
  to serve our great parts. That said, there have been few other clubs that appear to be looking to shift into the Leafs' new ownership
  and have more of a stake in their long and successful history.",
  "Jazz ForEver is on the edge of your mind. Songs from our time at S.U.
  There will have to be something to this; there were also music references that I'd forgotten about,
  so let's give one more of my favorites and let's begin by highlighting the 'myloves'.",
  "The Rock Underground Club are unique in one possible reason. The Rock Underground Club is essentially the lower section of the Ultras
  that is most likely to be moved in order to place them in the wall. The rocks can, in some cases, be rotated to form
  up to a fixed size on the rock. It's almost exactly what the Turtle Rock Ultras have done when they were added to the
  wall as they sit on top of the wall.",
  "Pop Fan Club's official website has been pulled from its website. As part of that, the site has been removed,
  which is the same method that was used to create the website's homepage at the start of this story.
  We can only take this as an opportunity to take a closer look at the fact that Underground Club has had a long history.",
  "Country Ultras, where your songs have to be sung to make sense, instead of relying purely on music notation to help you
  plan those kinds of songs. You've got really great musical notation and an extremely strong sense of narrative purpose.
  The more you spend and spend time on those basic ideas and processes, the more easily you may be able to plan those musical ideas.
  And it is amazing how far that can go for an individual artist.",
  "Reggae Fan Club: There is lots of beer in there. The bar is a great place to hang out with my friends. I can sit on the back of
  the bar and have a good time with my boyfriend. I like the sound system in this. The staff is great and the bar has an upstairs area.
  The ambiance and smell are quite good. I've always enjoyed drinking so far. I love the atmosphere.",
  "Blues Appreciation Society, of which we were in business before we took over the club, will stand to gain in value and be able to continue
  to serve our great parts. That said, there have been few other clubs that appear to be looking to shift into the Leafs' new ownership
  and have more of a stake in their long and successful history."
]

communities_locations = [
  "5 Mill Road London N95 1XY",
  "EC12 3XJ",
  "72 South Street London NW12 8FU",
  "N76 9YQ",
  "792 Alexander Road London WC61 3MG",
  "NW52 6QG",
  "25 The Grove London SW07 6PZ",
  "TQ80 1UC",
  "78 North Road COVENTRY CV75 1ZC",
  "W91 1ZC",
  "32 Richmond Road BRADFORD BD70 9DU",
  "66 Church Road TAUNTON TA90 0SO",
  "70 Grange Road DARLINGTON DL94 8FQ",
  "538 Grove Road PAISLEY PA21 4ZY",
  "Le Wagon Amsterdam",
  "Le Wagon Bali",
  "Le Wagon Berlin",
  "Le Wagon Brussels",
  "Le Wagon Buenos Aires",
  "Le Wagon Cape Town",
  "Le Wagon Casablanca",
  "Le Wagon Dubai",
  "Le Wagon Lisbon",
  "Le Wagon London",
  "Le Wagon Madrid",
  "Le Wagon Mauritius",
  "Le Wagon Melbourne",
  "Le Wagon Mexico",
  "Le Wagon Montreal",
  "Le Wagon Paris",
  "Le Wagon Rio de Janeiro",
  "Le Wagon Santiago Chile",
  "Le Wagon Shanghai",
  "Le Wagon Singapore",
  "Le Wagon Tokyo",
  "Le Wagon Zurich"
]

communities_names.each_with_index do |name, index|
  file = URI.open(commmunities_photo_url[index])
  community = Community.new(
    name:,
    description: communities_descriptions[index],
    location: communities_locations[index],
    genre: Genre.find_by(name: name.split.first),
    profile_id: index + 1
  )
  community.photo.attach(io: file, filename: "name.split.join('_').png", content_type: "image/png")
  community.save
end

puts "Adding Profiles to Communities..."
communities = Community.all
communities.each do |community|
  JoinCommunity.create(
    profile_id: community.profile_id,
    community_id: community.id
  )
end
profiles = Profile.all
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
genres = Genre.all
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
    Thank you for sharing your thoughts and other interesting stuff with the members of our community",
    profile_id: community.profile_id,
    community_id: community.id
  )
end

puts "Finished seeding successfully"
