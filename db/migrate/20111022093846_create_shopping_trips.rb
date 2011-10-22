class CreateShoppingTrips < ActiveRecord::Migration
  def change
    create_table :shopping_trips do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
