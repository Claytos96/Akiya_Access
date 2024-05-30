# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Property.destroy_all
User.destroy_all

puts "Creating users..."

users = [
  { first_name: "Sebastian", last_name: "Burke", dob: "01/03/2002", email: "sebastian.b@gmail.com", password: "123456" },
  { first_name: "Mamun", last_name: "Jan", dob: "15/08/2003", email: "mamun.j@gmail.com", password: "123456" },
  { first_name: "New", last_name: "User", dob: "15/08/2003", email: "abc@gmail.com", password: "123456" }
]

users.each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name}"
end

puts "Creating properties..."

properties = [
  {
    price: 19111, age: 1983, city: "Nagano", prefecture: "Kyoto",
    address: "Miyamacho Mitsuno, Nantan, Kyoto 601-0773, Japan", bedrooms: 5,
    description: "This 5-bedroom, 1-dining room, and 1-kitchen house is nestled amidst lush greenery, offering a tranquil escape for nature enthusiasts. The 39-year-old wooden home features public water and a convenient parking space. It is a short 6-minute walk from the Kawatani stop on the Nantan City Bus and a 15.8 km drive from the Wachi Station on the JR Sanin Main Line.",
    user: User.first,
    photo_url: 'https://miro.medium.com/v2/resize:fit:1100/format:webp/1*MiIHXrnOPuwXCwL3yE3iUA.png',
    photo_filename: "akiya.png"
  },
  {
    price: 11466, age: 1926, city: "Kyoto", prefecture: "Kyoto",
    address: "281 Shimonojō, Fukuchiyama, Kyoto 620-0211, Japan", bedrooms: 3,
    description: "This 130-year-old house is nestled in a tranquil residential neighborhood and boasts a detached building and a warehouse. The detached building spans 1,257 square feet, and the property offers ample parking for five kei cars.",
    user: User.last,
    photo_url: 'https://tokyoportfolio.com/wp-content/uploads/2023/10/akiyas-in-Japan.jpg',
    photo_filename: "akiya2.png"
  },
  {
    price: 22296, age: 1965, city: "Kyoto", prefecture: "Kyoto",
    address: "Kyotango, Kyoto 629-3101, Japan", bedrooms: 8,
    description: "This 8-bedroom, 1-kitchen house is located in a quiet area near the sea. The wooden, 2-story building is 58 years old and is a short 20-minute walk from Amino Station on the Amino-cho Line.",
    user: User.first,
    photo_url: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fzenbird.media%2Freusing-japans-vacant-akiya-homes-for-sustainable-living%2F&psig=AOvVaw0ZR0h34X1flBeqj4F3EVIm&ust=1717130169190000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCJDH58DGtIYDFQAAAAAdAAAAABAE',
    photo_filename: "akiya3.png"
  },
  {
    price: 15858, age: 1971, city: "Kyoto", prefecture: "Kyoto",
    address: "Tanaka Asukaicho, Kyoto, 606-8304 Japan", bedrooms: 1,
    description: "This 1-bedroom condo is located in Tanaka Asukaimachi, Sakyo Ward, Kyoto City, Kyoto Prefecture. The 51-year-old steel-frame building features 1 bedroom, 1 dining room, and 1 kitchen. It is a 6-minute walk from Tanaka Station on the Eizan Electric Railway Eizan Main Line.",
    user: User.first,
    photo_url: 'https://img4.athome.jp/image_files/path/_EUvG6gTHD3SpEkJQtucfQ==.jpeg',
    photo_filename: "akiya4.png"
  },
  {
    price: 10783, age: 1933, city: "Osaka", prefecture: "Osaka",
    address: "4 Hayashiji, Ikuno-ku, Osaka-shi, Osaka Prefecture", bedrooms: 3,
    description: "This 3-bedroom, 1-living room, 1-dining room, and 1-kitchen wooden house is 89 years old and is located in Ikuno-ku, Osaka. The house is a leasehold property with a new 20-year lease period. The house is conveniently located near shopping and has public transportation nearby including the JR Osaka Loop Line Teradamachi Station which is a 16-minute walk away.",
    user: User.first,
    photo_url: 'https://img01.suumo.com/front/gazo/bukken/060/N010000/img/922/74286922/74286922_0006.jpg',
    photo_filename: "akiya5.png"
  },
  {
    price: 19029, age: 1983, city: "Nantan", prefecture: "Kyoto",
    address: "Mitano Otana, Miyama-cho, Nantan City, Kyoto Prefecture", bedrooms: 5,
    description: "This 5-bedroom, 1-dining room, and 1-kitchen house is nestled amidst lush greenery, offering a tranquil escape for nature enthusiasts. The 39-year-old wooden home features public water and a convenient parking space. It is a short 6-minute walk from the Kawatani stop on the Nantan City Bus and a 15.8 km drive from the Wachi Station on the JR Sanin Main Line.",
    user: User.first,
    photo_url: 'https://img01.suumo.com/front/gazo/bukken/060/N010000/img/427/70078427/70078427_0006.jpg',
    photo_filename: "akiya6.png"
  },
  {
    price: 14589, age: 1955, city: "Moriguchi", prefecture: "Osaka",
    address: "3, Yakumo Kita-cho, Moriguchi City, Osaka Prefecture", bedrooms: 4,
    description: "This 68-year-old house is situated in a tranquil residential neighborhood. It boasts a generous balcony, four Japanese-style rooms (4DK), and is conveniently located near elementary and junior high schools. The property is serviced by public water, public sewer, and individual liquified petroleum gas. While parking is not available, the house's flat layout ensures ease of living.",
    user: User.first,
    photo_url: 'https://img01.suumo.com/front/gazo/bukken/060/N010000/img/021/72401021/72401021_0012.jpg',
    photo_filename: "akiya7.png"
  },
  {
    price: 12686, age: 1969, city: "Hino", prefecture: "Tottori",
    address: "Kurosaka, Hino-cho, Hino-gun, Tottori Prefecture", bedrooms: 5,
    description: "This 5-bedroom, 1-kitchen house is a 5-minute walk from Kurosaka Station on the JR Hoki Line. The 54-year-old wooden building has 2 floors. The Hino River is right in front of the property, offering opportunities for fishing, kayaking, gardening, pottery, or art in the garden. The price has been reduced!.",
    user: User.first,
    photo_url: 'https://image4.homes.jp/smallimg/image.php?file=http%3A%2F%2Fimg.homes.jp%2F135911%2Fsale%2F203%2F2%2F3%2Fievn.jpg&width=1024&height=1024',
    photo_filename: "akiya8.png"
  },
  {
    price: 748493, age: 1992, city: "Osaka", prefecture: "Osaka",
    address: "3-7-4 Higashinakamoto, Higashinari-ku, Osaka-shi, Osaka Prefecture", bedrooms: 5,
    description: "This 5-bedroom, 1-kitchen house is a 5-minute walk from Kurosaka Station on the JR Hoki Line. The 54-year-old wooden building has 2 floors. The Hino River is right in front of the property, offering opportunities for fishing, kayaking, gardening, pottery, or art in the garden. The price has been reduced!.",
    user: User.first,
    photo_url: 'https://img01.suumo.com/front/gazo/bukken/060/N010000/img/432/73110432/73110432_0001.jpg',
    photo_filename: "akiya9.png"
  },
  {
    price: 302569, age: 2021, city: "Nishinomiya", prefecture: "Hyogo",
    address: "Mimasaka-cho, Nishinomiya City, Hyogo Prefecture", bedrooms: 4,
    description: "This 5-bedroom, 1-kitchen house is a 5-minute walk from Kurosaka Station on the JR Hoki Line. The 54-year-old wooden building has 2 floors. The Hino River is right in front of the property, offering opportunities for fishing, kayaking, gardening, pottery, or art in the garden. The price has been reduced!.",
    user: User.first,
    photo_url: 'https://img01.suumo.com/front/gazo/bukken/060/N010000/img/238/73351238/73351238_0003.jpg',
    photo_filename: "akiya10.png"
  }
]

properties.each do |attributes|
  property = Property.new(attributes.except(:photo_url, :photo_filename))
  property.photo.attach(io: URI.open(attributes[:photo_url]), filename: attributes[:photo_filename], content_type: "image/png")
  property.save!
  puts "Created property in #{property.city}"
end

puts "Finished!"
