# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "Flatmate 1",
  email: "test1@test.com",
  password: "123456"
  )

User.create!(
  name: "Flatmate 2",
  email: "test2@test.com",
  password: "123456"
  )

Flat.create!(
  title: "Test Flat 1",
  address: "Test address 2, Auckland")

Flat.create!(
  title: "Test Flat 2",
  address: "Test address 2, Auckland")

t = Transaction.new(
  title: "Toilet paper",
  amount: "1.96"
  )

t.user = User.first
t.flat = Flat.first
t.save!

t = Transaction.new(
  title: "Bacon",
  amount: "2"
  )

t.user = User.last
t.flat = Flat.last
t.save!

g = Group.new

g.user = User.first
g.flat = Flat.first
g.save!

g = Group.new

g.user = User.last
g.flat = Flat.first
g.save!

g = Group.new

g.user = User.last
g.flat = Flat.last
g.save!
