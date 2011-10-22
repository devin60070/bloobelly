# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
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