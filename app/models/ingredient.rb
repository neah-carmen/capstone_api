class Ingredient < ApplicationRecord
  has_many :food_labels
  has_many :edibles, through: :food_labels
end
