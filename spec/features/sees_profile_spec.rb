require 'spec_helper'

feature 'user profile page' do
  scenario 'user views their own profile page' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    click_on 'View Profile'
    expect(page).to have_content(user.first_name)
  end
end
