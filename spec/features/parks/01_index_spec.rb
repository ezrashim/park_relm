require "rails_helper"
#
# I want to view a list of items
# So that I can pick items to review

# TO DO : As an authenticated user

feature "users can view parks" do

  scenario "visitor signs in and views parks on index page" do

    parks = FactoryGirl.create_list(:park_with_reviews, 2)
    visit root_path

    expect(page).to have_content "Parks"

    parks.each do |park|
      expect(page).to have_content(park.title)
      expect(page).to have_content(park.location)
      expect(page).to have_content(park.rating)
    end
  end
end
