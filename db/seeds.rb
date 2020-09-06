# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'Creating 2 users'
p '________________'

User.create!(
  name: 'Flatmate 1',
  email: 'test1@test.com',
  password: '123456'
  )

User.create!(
  name: 'Flatmate 2',
  email: 'test2@test.com',
  password: '123456'
  )

p 'Done!'
p 'Creating 4 flats'
p '________________'

n = 1
4.times do
  Flat.create!(
    title: "Test Flat #{n}",
    address: "Test address #{n}, Auckland"
  )
  n += 1
end

p 'Done!'
p 'Creating 10 Transactions'
p '________________'

title_array = [
  'toilet paper',
  'bacon',
  'toothbrush',
  'groceries',
  'washing powder',
  'electricity bill',
  'internet'
]

10.times do
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
p 'Creating 4 groups'
p '________________'

g = Group.new

4.times do
  g.user = User.all.sample
  g.flat = Flat.all.sample
  g.save!
end

