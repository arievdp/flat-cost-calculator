# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "User Puser",
  email: "test@test.com",
  password: "123456"
  )

Flat.create!(
  title: "Home sweet home",
  address: "7/29 Sentinel road, Auckland")

t = Transaction.new(
  title: "Toilet paper",
  amount: "1.96"
  )

t.user = User.first
t.flat = Flat.first
t.save!

g = Group.new

g.user = User.first
g.flat = Flat.first
g.save!
