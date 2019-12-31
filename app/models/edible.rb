class Edible < ApplicationRecord
  belongs_to :user

  has_many :food_labels
  has_many :ingredients, through: :food_labels

  def is_vegetarian?
    check = "not checked"
    ingredients_list = self.ingredients
    ingredients_list.each do |ingredient|
      if !ingredient.is_vegetarian
        check = "no"
        break
      else
        check = "yes"
      end
    end
    self.is_vegetarian = check
    self.save
  end
end
