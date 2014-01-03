require 'spec_helper'

feature 'user profile page' do
  scenario 'user views their own profile page' do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_on 'View Profile'
    expect(page).to have_content(user.first_name)
  end
end
