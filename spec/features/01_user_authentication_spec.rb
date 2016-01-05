require 'rails_helper'
require 'launchy'

feature 'authenticates a user' do
  before do
    user = create(:user)
    visit '/'
  end

  scenario 'user creates an account' do
    click_link('Sign Up')

    fill_in('First Name', :with => 'John')
    fill_in('Last Name', :with => 'Doe')
    fill_in('Enter password', :with => 'Seekrit')
    fill_in('Confirm password', :with => 'Seekrit')
    fill_in('Username', :with => 'john_doe123')
    fill_in('Email', :with => 'johndoe@123.com')
    fill_in('Profile Picture', :with => 'http://s3.amazonaws.com/37assets/svn/765-default-avatar.png')

    click_link('Submit')

    expect(page).to have_content("You have successfully signed in.")
  end

  scenario 'user signs in' do
    sign_in_as(user)
    expect(page).to have_content("You have successfully signed in.")
  end

  scenario 'user signs out' do
    sign_in_as(user)

    click_link('Sign Out')
    expect(page).to have_content("You have successfully signed out.")
  end

  scenario 'user updates information' do

    sign_in_as(user)

    click_link('Edit Profile')

    fill_in('Email', :with => 'notjohndoe@123.com')
    fill_in('Profile Picture', :with => 'http://vignette4.wikia.nocookie.net/detectiveconan96/images/7/72/Generic_Male_Profile.jpg/revision/latest?cb=20140709000724')

    click_link('Save Changes')
    expect(page).to have_content("You have successfully updated your profile.")
  end

  scenario 'user deletes information' do
    sign_in_as(user)

    click_link('Delete Account')
    expect(page).to have_content("Your account has been deleted.")
  end
end
