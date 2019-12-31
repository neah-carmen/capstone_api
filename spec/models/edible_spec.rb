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

    it "should set the value of is_vegetarian to 'no' if all of the ingredients of an Edible are vegetarian" do
      test_user = User.create(username: "test", email: "test@email.com", password: "password")
      test_ingredient = Ingredient.create(name: "Gelatin", is_vegetarian: "no")
      test_edible = Edible.create(name: "not_vegetarian", user_id: test_user.id)
      FoodLabel.create(edible_id: test_edible.id, ingredient_id: test_ingredient.id)
      test_edible.is_vegetarian?
      expect(test_edible.is_vegetarian).to eq("no")
    end
  end

  describe "#is_vegan?" do
    it "should set the value of is_vegan to 'yes' if all of the ingredients of an Edible are vegan" do
      test_user = User.create(username: "test", email: "test@email.com", password: "password")
      test_ingredient = Ingredient.create(name: "Corn Syrup", is_vegan: "yes")
      test_edible = Edible.create(name: "test_vegan", user_id: test_user.id)
      FoodLabel.create(edible_id: test_edible.id, ingredient_id: test_ingredient.id)
      test_edible.is_vegan?
      expect(test_edible.is_vegan).to eq("yes")
    end

    it "should set the value of is_vegan to 'no' if all of the ingredients of an Edible are vegan" do
      test_user = User.create(username: "test", email: "test@email.com", password: "password")
      test_ingredient = Ingredient.create(name: "Gelatin", is_vegan: "no")
      test_edible = Edible.create(name: "not_vegan", user_id: test_user.id)
      FoodLabel.create(edible_id: test_edible.id, ingredient_id: test_ingredient.id)
      test_edible.is_vegan?
      expect(test_edible.is_vegan).to eq("no")
    end
  end
end
