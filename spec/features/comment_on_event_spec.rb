require 'spec_helper'

feature 'Users can comment on an event' do
  let(:location) { 'Bar' }
  let(:address) { '90 Comm Ave' }
  let(:city) { 'Boston' }
  let(:state) { 'MA' }
  let(:num_invites) { 10 }
  let(:description) { 'mas foosball' }
  context 'with valid input' do
    scenario 'user comments on a post' do
      user = FactoryGirl.create(:user)
      foosball = Activity.create(name: 'Foosball')
      running = Activity.create(name: 'Running')
      visit '/'
      sign_in_as(user)
      build_event
      click_on 'Comment'
      fill_in 'Body', with: 'Commentary'
      fill_in 'Name', with: 'Not real name'
      click_on 'Post Comment'
      save_and_open_page
      expect(page).to have_content('Commentary')
    end
  end
end
