class Edible < ApplicationRecord
  belongs_to :user

  has_many :food_labels
  has_many :ingredients, through: :food_labels

  def is_vegetarian?
    check = "not checked"
    ingredients_list = self.ingredients
    ingredients_list.each do |ingredient|
      if ingredient.is_vegetarian == "no"
        check = "no"
        break
      else
        check = "yes"
      end
    end
    self.is_vegetarian = check
    self.save
  end

  def is_vegan?
    check = "not checked"
    ingredients_list = self.ingredients
    ingredients_list.each do |ingredient|
      if ingredient.is_vegan == "no"
        check = "no"
        break
      else
        check = "yes"
      end
    end
    self.is_vegan = check
    self.save
  end
end
