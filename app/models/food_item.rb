class FoodItem < ActiveRecord::Base
  belongs_to :food
  belongs_to :shopping_trip
end
