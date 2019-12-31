class Ingredient < ApplicationRecord
  has_many :food_labels
  has_many :edibles, through: :food_labels

  def format_params
    if self.is_vegetarian.downcase == "yes"
      self.is_vegetarian = "yes"
    elsif self.is_vegetarian.downcase == "no"
      self.is_vegetarian = "no"
    else
      self.is_vegetarian = "maybe"
    end
    if self.is_vegan.downcase == "yes"
      self.is_vegan = "yes"
    elsif self.is_vegan.downcase == "no"
      self.is_vegan = "no"
    else
      self.is_vegan = "maybe"
    end
    self.save
  end
end
