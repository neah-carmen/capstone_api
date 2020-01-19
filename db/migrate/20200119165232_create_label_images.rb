class CreateLabelImages < ActiveRecord::Migration[6.0]
  def change
    create_table :label_images do |t|
      t.string :url
      t.integer :edible_id

      t.timestamps
    end
  end
end
