require "rails_helper"

RSpec.describe Api::V1::VotesController, type: :controller do
  describe "POST /api/v1/votes" do
    it "creates a new vote" do
      user = create(:user)
      vote = create(:vote, vote: 1, user: user)

      post :create, vote: vote.attributes
      expect(response).to have_http_status(:created)
    end

    it "returns 'not_found' if validations fail" do
      post :create, vote: { vote: "", user_id: "", review_id: "" }
      expect(response).to have_http_status(:not_found)
    end
  end
end
