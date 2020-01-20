class Ingredient < ApplicationRecord
  has_many :food_labels
  has_many :edibles, through: :food_labels

  def format_params(params_vegetarian, params_vegan)
    if params_vegetarian.downcase == "true"
      self.is_vegetarian = true
    elsif params_vegetarian.downcase == "false"
      self.is_vegetarian = false
    end
    if params_vegan.downcase == "true"
      self.is_vegan = true
    elsif params_vegan.downcase == "false"
      self.is_vegan = false
    end
    self.save
  end
end
