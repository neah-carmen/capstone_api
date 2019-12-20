class CreateEdibles < ActiveRecord::Migration[6.0]
  def change
    create_table :edibles do |t|
      t.string :name
      t.string :upc
      t.integer :user_id
      t.integer :mod_id
      t.boolean :verified
      t.string :is_vegetarian
      t.string :is_vegan

      t.timestamps
    end
  end
end
