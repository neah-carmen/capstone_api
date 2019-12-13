class CreateFoodLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :food_labels do |t|
      t.integer :edible_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
