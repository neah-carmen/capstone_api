require "rails_helper"

RSpec.describe Edible, type: :model do
  describe "#user_id" do
    it "should have the #user_id of the user that created the new Edible" do
      test_user = User.create(username: "test", email: "test@email.com", password: "password")
      test_edible = Edible.create(name: "test_vegetarian", user_id: test_user.id)
      expect(test_edible.user_id).to eq(test_user.id)
    end

    it "should not let you create a new Edible if there is no associated #user_id" do
      test_edible = Edible.create(name: "test_vegetarian")
      expect(test_edible.id).to eq(nil)
    end
  end

  describe "#ingredients" do
    it "should return an array from the Ingredients model that the Edible model is associated to via the FoodLabel join table" do
      test_user = User.create(username: "test", email: "test@email.com", password: "password")
      test_ingredient1 = Ingredient.create(name: "Corn Syrup")
      test_ingredient2 = Ingredient.create(name: "Flour")
      test_ingredient3 = Ingredient.create(name: "Water")
      test_edible = Edible.create(name: "test_vegetarian", user_id: test_user.id)
      FoodLabel.create(edible_id: test_edible.id, ingredient_id: test_ingredient1.id)
      FoodLabel.create(edible_id: test_edible.id, ingredient_id: test_ingredient2.id)
      FoodLabel.create(edible_id: test_edible.id, ingredient_id: test_ingredient3.id)
      expect(test_edible.ingredients.length).to eq(3)
    end
  end

  describe "#is_vegetarian?" do
    it "should set the value of is_vegetarian to 'yes' if all of the #ingredients of an Edible are vegetarian" do
      test_user = User.create(username: "test", email: "test@email.com", password: "password")
      test_ingredient = Ingredient.create(name: "Corn Syrup", is_vegetarian: "yes")
      test_edible = Edible.create(name: "test_vegetarian", user_id: test_user.id)
      FoodLabel.create(edible_id: test_edible.id, ingredient_id: test_ingredient.id)
      test_edible.is_vegetarian?
      expect(test_edible.is_vegetarian).to eq("yes")
    end

    it "should set the value of is_vegetarian to 'no' if any of the #ingredients of an Edible are not vegetarian" do
      test_user = User.create(username: "test", email: "test@email.com", password: "password")
      test_ingredient = Ingredient.create(name: "Gelatin", is_vegetarian: "no")
      test_edible = Edible.create(name: "not_vegetarian", user_id: test_user.id)
      FoodLabel.create(edible_id: test_edible.id, ingredient_id: test_ingredient.id)
      test_edible.is_vegetarian?
      expect(test_edible.is_vegetarian).to eq("no")
    end
  end

  describe "#is_vegan?" do
    it "should set the value of is_vegan to 'yes' if all of the #ingredients of an Edible are vegan" do
      test_user = User.create(username: "test", email: "test@email.com", password: "password")
      test_ingredient = Ingredient.create(name: "Corn Syrup", is_vegan: "yes")
      test_edible = Edible.create(name: "test_vegan", user_id: test_user.id)
      FoodLabel.create(edible_id: test_edible.id, ingredient_id: test_ingredient.id)
      test_edible.is_vegan?
      expect(test_edible.is_vegan).to eq("yes")
    end

    it "should set the value of is_vegan to 'no' if any of the #ingredients of an Edible are not vegan" do
      test_user = User.create(username: "test", email: "test@email.com", password: "password")
      test_ingredient = Ingredient.create(name: "Gelatin", is_vegan: "no")
      test_edible = Edible.create(name: "not_vegan", user_id: test_user.id)
      FoodLabel.create(edible_id: test_edible.id, ingredient_id: test_ingredient.id)
      test_edible.is_vegan?
      expect(test_edible.is_vegan).to eq("no")
    end
  end
end
