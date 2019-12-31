require "rails_helper"

RSpec.describe Edible, type: :model do
  describe "#is_vegetarian?" do
    it "should set the value of is_vegetarian to 'yes' if all of the ingredients of an Edible are vegetarian" do
      test_user = User.create(username: "test", email: "test@email.com", password: "password")
      test_ingredient = Ingredient.create(name: "Corn Syrup", is_vegetarian: "yes")
      test_edible = Edible.create(name: "test_vegetarian", user_id: test_user.id)
      FoodLabel.create(edible_id: test_edible.id, ingredient_id: test_ingredient.id)
      test_edible.is_vegetarian?
      expect(test_edible.is_vegetarian).to eq("yes")
    end
  end
end
