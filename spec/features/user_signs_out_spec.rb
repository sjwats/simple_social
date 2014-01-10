require 'spec_helper'

feature 'user signs out' do
  scenario 'signed in user signs out' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    expect(page).to have_content('Sign Out')
    click_link 'Sign Out'
    expect(page).to have_content('Sign In')
    expect(page).to_not have_content('Sign Out')
    expect(page).to have_content('Signed Out. Come back soon!')
  end


end
