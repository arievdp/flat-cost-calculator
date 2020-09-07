# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'Creating 4 users'
p '________________'

n = 1
4.times do
  User.create!(
    name: "Flatmate #{n}",
    email: "test#{n}@test.com",
    password: '123456'
    )
  n += 1
end

p 'Done!'
p 'Creating 3 flats'
p '________________'

n = 1
3.times do
  Flat.create!(
    title: "Test Flat #{n}",
    address: "Test address #{n}, Auckland"
  )
  n += 1
end

p 'Done!'
p 'Creating 20 Transactions'
p '________________'

title_array = [
  'toilet paper',
  'bacon',
  'toothbrush',
  'groceries',
  'washing powder',
  'electricity bill',
  'internet',
  'rent'
]

20.times do
  u = User.all.sample
  f = Flat.all.sample
  amount = rand(1.0...100.0).round(2)
  t = Transaction.new(
  title: title_array.sample,
  amount: amount,
  category: 'expense'
  )
  t.user = u
  t.flat = f
  f.balance += amount
  t.save!
  f.save!
end

p 'Done!'
p 'Creating groups'
p '________________'

User.all.each do |u|
  Flat.all.each do |f|
    g = Group.new
    g.user = u
    g.flat = f
    g.save!
  end
end

p 'Done!'
