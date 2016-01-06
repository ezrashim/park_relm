require 'rails_helper'
require 'launchy'

feature 'sign in', %Q{
  As an unauthenticated user
  I want to sign in
  So that I can post items and review them
  } do
    # ACCEPTANCE CRITERIA
    # * I must enter a user's email address
    # * I must enter a user's password
    # * If I do not perform the above, I get an error message
    # * If I specify valid information, I sign in to my account and am authenticated

  before do
    user = create(:user)
    visit root_path
  end

  scenario 'an existing user specifies a valid email and password' do
    click_link 'Sign In'
    fill_in('Email', with: user.email)
    fill_in('Enter Password', with: user.password)
    fill_in('Confirm Password', with: user.password_confirmation)
    click_button('Sign Up')

    expect(page).to have_content("You have successfully signed in.")
    expect(page).to have_content("Sign Out")
  end

  scenario 'a nonexistent email and password is supplied' do

  end

  scenario 'an existing email with the wrong password is denied access' do

  end

  scenario 'an already authenticated user cannot re-sign in' do

  end
end
