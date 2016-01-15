require "rails_helper"
#
# As an authenticated user
# I want to view a list of items
# So that I can pick items to review

feature "authenticated users can view parks" do

  scenario "visitor signs in and views parks on index page" do
    parks = create_list(:park_with_reviews, 3)
    visit root_path

    expect(page).to have_content "PARKS"

    parks.each do |park|
      visit park_path(park)

      expect(page).to have_content(park.title)
      expect(page).to have_content(park.location)
      expect(page).to have_content(park.reviews.average(:rating))
    end
  end

  scenario "visitor signs in and views parks on index page" do
    park = create(:park)
    visit root_path

    expect(page).to have_content "PARKS"

    visit park_path(park)

    expect(page).to have_content(park.title)
    expect(page).to have_content(park.location)
    expect(page).to have_content(park.reviews.average(:rating))
    expect(page).to have_content("Bathrooms Available")
    expect(page).to have_content("Picnic Facilities Available")
    expect(page).to have_content("Pets Allowed")
    expect(page).to have_content("Basketball Courts Available")
    expect(page).to have_content("Baseball Field Available")
  end
end
