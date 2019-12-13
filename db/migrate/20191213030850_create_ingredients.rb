class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :not_vegetarian
      t.string :not_vegan

      t.timestamps
    end
  end
end
