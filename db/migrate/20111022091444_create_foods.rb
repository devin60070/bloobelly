class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measure
      t.string :water_usage

      t.timestamps
    end
  end
end
