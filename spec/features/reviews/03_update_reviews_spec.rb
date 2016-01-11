require "rails_helper"

# As an authenticated user
# I want to update a review's information
# So that I can correct errors or provide new information

feature "review creator can edit review information" do

  scenario "Review creator signs in and navigates to edit review page" do
    review = create(:review)
    park = review.park
    user = review.user

    sign_in_as(user)

    click_link (park.title)
    click_link("Edit")

    expect(page).to have_content("Edit Review")
  end

  scenario "Review creator creates and edits new review" do
    review = create(:review)
    park = review.park
    user = review.user

    sign_in_as(user)

    click_link (park.title)
    click_link("Edit")

    fill_in("Title", with: "Edited Title")
    fill_in("Body", with: "EditedCity")
    click_button("Update")

    expect(page).to have_content("Edited Title")
    expect(page).to have_content("EditedCity")
  end

  scenario "Review creator creates and edits new review incorrectly" do
    review = create(:review)
    park = review.park
    user = review.user

    sign_in_as(user)

    click_link (park.title)
    click_link("Edit")

    fill_in("Title", with: "")
    fill_in("Body", with: "")
    click_button("Update")

    expect(page).to have_content("Invalid input.")

  end
end
