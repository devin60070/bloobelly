class AddShoppingTripIdToFoodItem < ActiveRecord::Migration
  def change
    add_column :food_items, :shopping_trip_id, :integer
  end
end
