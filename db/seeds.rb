# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])

conditions = { :email => 'devin60070@gmail.com', 
               :password => '123',
               :password_confirmation => '123' }

pp = User.where({conditions}).first || User.create(conditions)

Food.create(
    :name => 'rice',
    :water_usage=> '600',
    :measure => 'Small Bag'

)    
Food.create(
    :name => 'carrot',
    :water_usage=> '35',
    :measure => 'Dozen'
)

Shopping_trip.create(
  :total=> '1235',
  :user_id=>1
  )

Food_item.create(
    :food_id => 1,
    :number =>2,
    :shopping_trip_id =>1

)    

Food_item.create(
    :food_id => 2,
    :number =>1,
    :shopping_trip_id =>1

)    



  