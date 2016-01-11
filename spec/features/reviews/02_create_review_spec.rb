require 'rails_helper'

feature 'add a new review', %{
  As a user
  I want to add a review
  So that I can post my review
  } do
  # ACCEPTANCE CRITERIA
  # * As an authenticated user, I can add a new review

  scenario 'authenticated user adds reviews on park show page' do
    park = create(:park)

    user = create(:user)

    visit root_path
    sign_in_as(user)

    visit root_path
    click_link (park.title)

    fill_in("Title", with: "Awesome park")
    fill_in("Body", with: "I can go to this park anytime of the year")
    select "10", from: "Rating"
    click_button ("Add a Review")

    expect(page).to have_content("Awesome park")
    expect(page).to have_content("I can go to this park anytime of the year")
    expect(page).to have_content("10")
  end

  scenario 'authenticated user adds invalid review info on park show page' do
    park = create(:park)
    user = create(:user)

    visit root_path
    sign_in_as(user)

    visit root_path
    click_link (park.title)

    fill_in("Title", with: "")
    fill_in("Body", with: "")
    click_button ("Add a Review")

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end
