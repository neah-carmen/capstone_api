class Ingredient < ApplicationRecord
  has_many :food_labels
  has_many :edibles, through: :food_labels

  def format_params(params_vegetarian, params_vegan)
    if params_vegetarian.downcase == "yes"
      self.is_vegetarian = "yes"
    elsif params_vegetarian.downcase == "no"
      self.is_vegetarian = "no"
    else
      self.is_vegetarian = "maybe"
    end
    if params_vegan.downcase == "yes"
      self.is_vegan = "yes"
    elsif params_vegan.downcase == "no"
      self.is_vegan = "no"
    else
      self.is_vegan = "maybe"
    end
    self.save
  end
end
