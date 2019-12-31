require "rails_helper"

RSpec.describe User, type: :model do
  describe "#user_id" do
    it "should validate that a user cannot be created without an email address" do
      test_user = User.create(email: nil)
      expect(test_user.id).to eq(nil)
    end
  end
end
