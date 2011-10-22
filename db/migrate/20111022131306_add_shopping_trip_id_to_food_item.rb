class AddShoppingTripIdToFoodItem < ActiveRecord::Migration
  def change
    add_column :food_items, :Shopping_trip_id, :integer
  end
end
