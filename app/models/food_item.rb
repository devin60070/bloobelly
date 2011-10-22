class FoodItem < ActiveRecord::Base
  has_one :food
  belongs_to :shopping_trip
end
