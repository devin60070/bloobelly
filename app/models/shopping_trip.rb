class ShoppingTrip < ActiveRecord::Base
  has_many :food_items
  accepts_nested_attributes_for :food_items
end
