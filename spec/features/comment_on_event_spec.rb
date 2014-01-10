require 'spec_helper'

feature 'Users can comment on an event' do
  scenario 'user comments on a post' do
    user = FactoryGirl.create(:user)
    visit '/'
    sign_in_as(user)
  end
end
