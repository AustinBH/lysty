# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



5.times do
User.create(
  name: Faker::Games::SuperSmashBros.fighter,
  email: Faker::Internet.email,
  password: "123",
  password_confirmation: "123"
)
end

5.times do
List.create(
  title: Faker::Space.star,
  user: User.all.sample
)
end

10.times do
Product.create(
  name: Faker::Commerce.product_name,
  price: Faker::Commerce.price,
  origin: Faker::Address.country
)
end

25.times do
  ListProduct.create(
    list: List.all.sample,
    product: Product.all.sample
  )
end

10.times do
Store.create(
  name: "#{Faker::Color.color_name.capitalize} #{Faker::Superhero.power}",
  location: Faker::Address.full_address
)
end
