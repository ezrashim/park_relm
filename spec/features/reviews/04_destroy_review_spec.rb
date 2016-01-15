require "rails_helper"

# As an authenticated user
# I want to delete a review
# So that I can remove it from a park's show page

feature "review creator can edit review information" do

  scenario "Review creator signs in and navigates to edit review page" do
    review = create(:review)
    park = review.park
    user = review.user

    sign_in_as(user)

    click_link (park.title)

    click_link("Delete")

    expect(page).to_not have_content(review.title)
    expect(page).to_not have_content(review.body)
  end
end
