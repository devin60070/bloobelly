class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.integer :food_id
      t.integer :number

      t.timestamps
    end
  end
end
