class Edible < ApplicationRecord
  belongs_to :user

  has_many :food_labels
  has_many :ingredients, through: :food_labels
  has_many :label_images

  def is_vegetarian?
    check = "not checked"
    ingredients_list = self.ingredients
    ingredients_list.each do |ingredient|
      if ingredient.is_vegetarian == false
        check = false
        break
      else
        check = true
      end
    end
    self.is_vegetarian = check
    self.save
  end

  def is_vegan?
    check = "not checked"
    ingredients_list = self.ingredients
    ingredients_list.each do |ingredient|
      if ingredient.is_vegan == false
        check = false
        break
      else
        check = true
      end
    end
    self.is_vegan = check
    self.save
  end
end
