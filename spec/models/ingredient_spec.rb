require "rails_helper"

RSpec.describe Ingredient, type: :model do
  describe "#format_params" do
    it "should format the value for #is_vegetarian so that any casing for the parameter 'yes' is saved as 'yes'" do
      test_ingredient = Ingredient.create(name: "test_ingredient")
      test_ingredient.format_params("YES", "yes")
      expect(test_ingredient.is_vegetarian).to eq("yes")
    end

    it "should format the value for #is_vegetarian so that any casing for the parameter 'no' is saved as 'no'" do
      test_ingredient = Ingredient.create(name: "test_ingredient")
      test_ingredient.format_params("NO", "no")
      expect(test_ingredient.is_vegetarian).to eq("no")
    end

    it "should format the value for #is_vegan so that any casing for the parameter 'yes' is saved as 'yes'" do
      test_ingredient = Ingredient.create(name: "test_ingredient")
      test_ingredient.format_params("yes", "YES")
      expect(test_ingredient.is_vegan).to eq("yes")
    end

    it "should format the value for #is_vegan so that any casing for the parameter 'no' is saved as 'no'" do
      test_ingredient = Ingredient.create(name: "test_ingredient")
      test_ingredient.format_params("no", "NO")
      expect(test_ingredient.is_vegan).to eq("no")
    end
  end
end
