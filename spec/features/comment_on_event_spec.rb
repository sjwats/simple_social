require 'spec_helper'

feature 'Users can comment on an event' do
  scenario 'user comments on a post' do
    user = FactoryGirl.create(:user)
    visit '/'
    sign_in_as(user)
    click_on 'Comment'
    fill_in 'Body', with: 'Commentary'
    fill_in 'Name', with: 'Not real name'
    click_on 'Post Comment'
    expect(page).to have_content('Commentary')
  end
end
