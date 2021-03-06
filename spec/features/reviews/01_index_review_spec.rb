require 'rails_helper'

feature 'when user goes to park show page, park reviews are listed', %{
  As a user
  I want to see park reviews
  So that I can read or view reviews
  } do
  # ACCEPTANCE CRITERIA
  # * If I go to a park's show page, I can view all of its reviews

  scenario 'user views reviews on park show page' do
    park = create(:park_with_reviews)
    user = create(:user)
    sign_in_as(user)

    visit root_path
    click_link (park.title)
    expect(page).to have_content(park.reviews.first.title)
  end
end
