class ShoppingTrip < ActiveRecord::Base
  belongs_to :user
  has_many :food_items
  accepts_nested_attributes_for :food_items
end
