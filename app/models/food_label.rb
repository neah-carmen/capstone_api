class FoodLabel < ApplicationRecord
  belongs_to :edible
  belongs_to :ingredient
end
