require 'spec_helper'

feature 'user profile page' do
  scenario 'signed in user views their own profile page' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    click_on 'Profile'
    expect(page).to have_content(user.first_name)
  end

  scenario 'un-authenticated user tries to view profile page' do
    visit '/'
    expect(page).to_not have_content('Profile')
  end
end
