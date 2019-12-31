require "rails_helper"

RSpec.describe Ingredient, type: :model do
  describe "#format_params" do
    it "should format the values for #is_vegetarian so that it is 'yes'" do
      test_ingredient = Ingredient.create(name: "test_ingredient", is_vegetarian: "YES")
      expect(test_ingredient.is_vegetarian).to eq("yes")
    end
  end
end
