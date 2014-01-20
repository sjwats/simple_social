require 'spec_helper'

feature 'user can opt to join an event' do
  scenario 'user joins an event' do
    user = FactoryGirl.create(:user)
    event = FactoryGirl.create(:event)
    binding.pry
    sign_in_as(user)
    save_and_open_page
    visit event_path(event)
    click_on 'Join Event'
    expect(page).to have_content('Joined Event!')
  end
end
