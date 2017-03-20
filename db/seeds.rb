# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#require "stilltasty"

# This is an example of what I want:
#
# user1.food.create(name: 'Potato Chips, Commercially Packaged — Opened', still_tasty_id: '18077', shelf_life: , purchased: , user_id: )
#

#uncomment when this is complete
#User.delete_all
#Food.delete_all

User.create(first_name: 'John', last_name: 'Doe', phone_number: '215-111-1111', email: 'jdoe@nobobdy.com', password: '123456', password_confirmation: '123456')
#search1 = StillTasty.search("apple")
#search1_id = StillTasty.name_search("apple")[0]["id"]
#user1.Food.create(name: search1["name"], id: search1_id, shelf_life: search1["methods"][0]["expirationTime"])


=begin user2 = User.create(first_name: 'Mary', last_name: 'Maryson', phone_number: '215-222-2222', email: 'mary@maryson.com', password: '123456', password_confirmation: '123456')
search2 = StillTasty.search("pear")
search2_id = StillTasty.name_search("pear")[0]["id"]
user2.food.create(name: search2["name"], id: search2_id, shelf_life: search2["methods"][0]["expirationTime"])



user3 = User.create(first_name: 'Baba', last_name: 'Booey', phone_number: '215-333-3333', email: 'baba@booey.com', password: '123456', password_confirmation: '123456')
search3 = StillTasty.search("peach")
search3_id = StillTasty.name_search("peach")[0]["id"]
user3.food.create(name: search3["name"], id: search3_id, shelf_life: search3["methods"][0]["expirationTime"])


user4 = User.create(first_name: 'Fred', last_name: 'Fredson', phone_number: '215-444-4444', email: 'fred@fredson.com', password: '123456', password_confirmation: '123456')
search4 = StillTasty.search("banana")
search4_id = StillTasty.name_search("banana")[0]["id"]
user4.food.create(name: search4["name"], id: search4_id, shelf_life: search4["methods"][0]["expirationTime"])



user5 = User.create(first_name: 'Jane', last_name: 'Dough', phone_number: '555-555-5556', email: 'jane@nobobdy.com', password: '123456', password_confirmation: '123456')
search5 = StillTasty.search("orange")
search5_id = StillTasty.name_search("orange")[0]["id"]
user5.food.create(name: search5["name"], id: search5_id, shelf_life: search5["methods"][0]["expirationTime"])





puts "Sucess Database Seeds Loaded"

=end 
