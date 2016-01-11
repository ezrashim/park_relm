require 'rails_helper'

describe User do
  describe "#admin?" do
    it "is not an admin if the role is not admin" do
      user = create(:user, role: "member")
      expect(user.admin?).to eq(false)
    end

    it "is an admin if the role is admin" do
      user = create(:user, role: "admin")
      expect(user.admin?).to eq(true)
    end
  end
end
