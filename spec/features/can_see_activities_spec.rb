require 'spec_helper'

feature 'user can see list of activities' do
  scenario 'user can navigate to an activity list' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_link 'Activities List'
    expect(page).to have_content('Select Your Favorite Activities')
  end

  scenario 'user can add an activity to the list' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_link 'Activities List'
    click_link 'Add a new activity to the list'
    fill_in 'Name', with: 'Hiking'
    click_button 'Add Activity'
    save_and_open_page
    expect(page).to have_content('Hiking')
  end
end
