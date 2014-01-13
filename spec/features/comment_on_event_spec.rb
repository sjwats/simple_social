require 'spec_helper'

feature 'Users can comment on an event' do
  let(:location) { 'Bar' }
  let(:address) { '90 Comm Ave' }
  let(:city) { 'Boston' }
  let(:state) { 'MA' }
  let(:num_invites) { 10 }
  let(:description) { 'mas foosball' }
  context 'with valid input' do
    scenario 'user comments on an event' do
      user = FactoryGirl.create(:user)
      foosball = Activity.create(name: 'Foosball')
      running = Activity.create(name: 'Running')
      visit '/'
      sign_in_as(user)
      build_event
      click_on 'Comment'
      save_and_open_page
      fill_in 'Body', with: 'Commentary'
      fill_in 'Name', with: 'Not real name'
      click_on 'Post Comment'
      expect(page).to have_content('Commentary')
      expect(page).to have_content('Comment successfully posted')
    end
  end
  context 'with invalid input' do
    scenario 'user tries to comment with on an event with invalid input' do
      user = FactoryGirl.create(:user)
      foosball = Activity.create(name: 'Foosball')
      running = Activity.create(name: 'Running')
      visit '/'
      sign_in_as(user)
      build_event
      click_on 'Comment'
      click_on 'Post Comment'
      expect(page).to_not have_content('Comment successfully posted')
      within '.input.comment_name' do
        expect(page).to have_content("can't be blank")
      end
      within '.input.comment_body' do
        expect(page).to have_content("can't be blank")
      end
    end
  end
end
