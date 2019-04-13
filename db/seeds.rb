# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

	# Create Users
	  10.times do
	    user = User.new(
	      name:     Faker::Name.name,
	      email:    Faker::Internet.email,
	      password: Faker::Lorem.characters(10)
	    )
	    user.skip_confirmation!
	    user.save!
	  end
	  users = User.all
    user = User.first
    	user.skip_confirmation!
    	user.update_attributes!(
    	  email: 'guncho@gmail.com',
    	  password: '12121212',
    	  name: 'Edy'
    	  )
	# Create Items
  50.times do
  Item.create!(
              user:         users.sample,
              name:         Faker::Lorem.sentence,
	              created_at:   Faker::Date.backward(7)

	  )
	end
	items = Item.all

	puts "Seed finished"
	puts "#{User.count} users created"
	puts "#{Item.count} items created"
  
