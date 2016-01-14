require "rails_helper"
#
# As an authenticated user
# I want to view a list of items
# So that I can pick items to review

feature "authenticated users can view parks" do
  scenario "visitor signs in and views parks on index page" do
    parks = create_list(:park, 3)

    visit root_path

    expect(page).to have_content "PARKS"

    parks.each do |park|
      visit park_path(park)
      expect(page).to have_content(park.title)
      expect(page).to have_content(park.location)
      expect(page).to have_content(park.rating)
    end
  end

  let(:park) {
    Park.create!(
      title: "Commons",
      location: "Boston",
      rating: 10,
      bathroom: true,
      picnic: true,
      pets: true,
      basketball: true,
      baseball: true
    )
  }

  scenario "visitor signs in and views parks on index page" do

    visit root_path

    expect(page).to have_content "PARKS"

    visit park_path(park)
    expect(page).to have_content(park.title)
    expect(page).to have_content(park.location)
    expect(page).to have_content(park.rating)
    expect(page).to have_content("Bathrooms available")
    expect(page).to have_content("Picnic facilities available")
    expect(page).to have_content("Pets allowed")
    expect(page).to have_content("basketball courts available")
    expect(page).to have_content("Baseball field available")
  end
end
