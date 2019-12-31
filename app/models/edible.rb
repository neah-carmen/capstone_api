class Edible < ApplicationRecord
  belongs_to :user

  has_many :food_labels
  has_many :ingredients, through: :food_labels

  def is_vegetarian?
    check = nil
    ingredients_list = self.ingredients
    ingredients_list.each do |ingredient|
      if !ingredient.is_vegetarian
        check = false
        break
      else
        check = true
      end
    end
    if check == true
      puts "is vegetarian"
    else
      puts "not vegetarian"
    end
  end
end
