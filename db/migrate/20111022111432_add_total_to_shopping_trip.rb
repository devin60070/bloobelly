class AddTotalToShoppingTrip < ActiveRecord::Migration
  def change
    add_column :shopping_trips, :total, :integer
  end
end
