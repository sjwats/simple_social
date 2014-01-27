require 'spec_helper'

feature "user can post on another users wall" do
  scenario 'user posts on another users wall' do
    user = FactoryGirl.create(:user)
    foosball = Activity.create(name: 'Foosball')
    running = Activity.create(name: 'Running')
    sign_in_as(user)
    build_event


  end



end
