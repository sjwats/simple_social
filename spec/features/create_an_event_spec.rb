require 'spec_helper'

feature 'user creates a new event' do
  context 'with valid information' do
    let(:location) { 'Bar' }
    let(:address) { '90 Comm Ave' }
    let(:city) { 'Boston' }
    let(:state) { 'MA' }
    let(:num_invites) { 10 }
    let(:description) { 'mas foosball' }

    scenario 'user creates an event with valid info' do
      user = FactoryGirl.create(:user)
      foosball = Activity.create(name: 'Foosball')
      running = Activity.create(name: 'Running')
      sign_in_as(user)
      build_event
      expect(page).to have_content('Event Created Successfully')
      expect(page).to have_content(location)
      expect(page).to have_content(num_invites)
      expect(page).to have_content(city)
      expect(page).to have_content(state)
      expect(page).to have_content(description)
      expect(page).to have_content(foosball.name)
    end

    scenario 'user can see all events matching their activity prefs' do
      user = FactoryGirl.create(:user)
      foosball = Activity.create(name: 'Foosball')
      running = Activity.create(name: 'Running')
      sign_in_as(user)
      click_link 'View/Select from List'
      check foosball.name
      check running.name
      click_on 'Save Preferred Activities'
      build_events
      visit users_path
      expect(page).to have_content(location)
      expect(page).to have_content(city)
      expect(page).to have_content(state)
      expect(page).to have_content(foosball.name)
      expect(page).to have_content('View Details')
      expect(page).to have_content('Running')
    end
  end

  context 'with invalid information' do
    scenario 'user creates event with invalid attributes' do
      user = FactoryGirl.create(:user)
      foosball = Activity.create(name: 'Foosball')
      running = Activity.create(name: 'Running')
      sign_in_as(user)
      click_on 'Create New Event'
      click_on 'Create Event'
      within '.input.event_city' do
        expect(page).to have_content("can't be blank")
      end
      within '.input.event_state' do
        expect(page).to have_content("can't be blank")
      end
      within '.input.event_description' do
        expect(page).to have_content("can't be blank")
      end
      within '.input.event_activity' do
        expect(page).to have_content("can't be blank")
      end
      within '.input.event_start_time' do
        expect(page).to have_content('must be before')
      end
    end

    scenario 'un-authenticated user tries to create event' do
      visit '/'
      expect(page).to_not have_content('Create A New Event')
    end
  end

end
