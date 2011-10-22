# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])

conditions = { :email => 'devin.lundberg@gmail.com', 
               :password => '123',
               :password_confirmation => '123' }

pp = User.where({ :email => 'devin.lundberg@gmail.com'}).first || User.create(conditions)

Food.create(
    :name => 'rice',
    :water_usage=> 600,
    :measure => 'Small Bag'

)    
Food.create(
    :name => 'carrot',
    :water_usage=> 35,
    :measure => 'Dozen'
)

ShoppingTrip.create(
  :total=> 1235,
  :user_id=>pp.id
  )

FoodItem.create(
    :food_id => 1,
    :number =>2,
    :Shopping_trip_id =>1

)    

FoodItem.create(
    :food_id => 2,
    :number =>1,
    :Shopping_trip_id =>1

)    



  