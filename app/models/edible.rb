class Edible < ApplicationRecord
  belongs_to :user

  has_many :food_labels
  has_many :ingredients, through: :food_labels
end
