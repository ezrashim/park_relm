require "rails_helper"
#
# I want to view a list of 10+ parks
# So that I can see only 10 items per page

feature "users can view parks" do
  let! (:parks2) { create_list(:park_with_reviews, 5, rating: 2) }
  let! (:parks4) { create_list(:park_with_reviews, 5, rating: 4) }
  let! (:parks6) { create_list(:park_with_reviews, 5, rating: 6) }
  let! (:parks8) { create_list(:park_with_reviews, 5, rating: 8) }
  let! (:parks10) { create_list(:park_with_reviews, 5, rating: 10) }

  scenario "visitor sees the 10 highest rated parks" do
    park_list = parks2 + parks4 + parks6 + parks8 + parks10
    park_sort = park_list.sort_by { |park| park.reviews.average(:rating) }
    visit root_path

    expect(page).to have_content park_sort.last.title
    expect(page).to_not have_content park_sort.first.title
  end
end
