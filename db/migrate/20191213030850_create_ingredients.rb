class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :is_vegetarian
      t.string :is_vegan

      t.timestamps
    end
  end
end
