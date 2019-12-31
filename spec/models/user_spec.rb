require "rails_helper"

RSpec.describe User, type: :model do
  describe "#email" do
    it "should validate that a new User cannot be created without an #email" do
      test_user = User.create(email: nil)
      expect(test_user.id).to eq(nil)
    end
  end

  describe "#password" do
    it "should validate that a new User cannot be created without a #password" do
      test_user = User.create(email: "test@email.com", password: nil)
      expect(test_user.id).to eq(nil)
    end
  end
end
