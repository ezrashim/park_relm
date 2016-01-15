require 'rails_helper'

feature 'create vote', %{
  As a user
  I want to vote on a review
  So that I can show my support for a review
  } do
  # ACCEPTANCE CRITERIA
  # * User should be able to click "Vote" on a review from the review show page
  # * Should occur without page reload

  let!(:park) { create(:park_with_reviews)}
  let!(:user) { create(:user) }

  scenario 'user up votes on a review' do
    sign_in_as(user)
    click_link (park.title)

    click_button("Up")
    expect(page).to have_content("You have up voted successfully!")
    expect(page).to have_content("Vote Count: 1")
  end

  scenario 'user down votes on a review' do
    sign_in_as(user)
    click_link (park.title)

    click_button("Down")
    expect(page).to have_content("You have down voted successfully!")
    expect(page).to have_content("Vote Count: -1")
  end

  scenario 'user up votes on a review twice' do
    sign_in_as(user)
    click_link (park.title)

    click_button("Up")
    click_button("Up")

    expect(page).to have_content("You can't vote twice!")
    expect(page).to have_content("Vote Count: 1")
    expect(page).to_not have_content("Vote Count: 0")
    expect(page).to_not have_content("You have up voted successfully!")
  end

  scenario 'user down votes on a review twice' do
    sign_in_as(user)
    click_link (park.title)

    click_button("Down")
    click_button("Down")
    expect(page).to have_content("You can't vote twice!")
    expect(page).to have_content("Vote Count: -1")
  end

  scenario 'user down votes on a review twice' do
    sign_in_as(user)
    click_link (park.title)

    click_button("Up")
    expect(page).to have_content("Vote Count: 1")
    click_button("Down")

    expect(page).to have_content("Vote Count: 0")
    expect(page).to have_content("You have successfully updated your rating!")
  end
end
