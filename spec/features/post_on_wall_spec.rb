require 'spec_helper'

feature "user can post on a user show page" do
  scenario 'user posts on their user show page' do
    user = FactoryGirl.create(:user)
    foosball = Activity.create(name: 'Foosball')
    running = Activity.create(name: 'Running')
    sign_in_as(user)
    build_event


  end



end
