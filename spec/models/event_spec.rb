require 'spec_helper'

describe Event do
  it { should validate_presence_of(:start_time) }

  it { should validate_presence_of(:end_time) }

  it { should have_valid(:location_name).when('TD Garden', 'Random park name') }

  it { should have_valid(:street_address).when('132 This street') }

  it { should have_valid(:city).when('Boston', 'New Cityname') }
  it { should_not have_valid(:city).when(nil, '') }

  it { should have_valid(:state).when('MA', 'New Hapmshire', 'Maine') }
  it { should_not have_valid(:state).when(nil, '') }

  it { should have_valid(:num_attendees_requested).when(3, 4) }

  it { should have_valid(:description).when("Let's play ball", "This is the activity. Yada yada description.") }
  it { should_not have_valid(:description).when(nil, '') }

  it { should belong_to :activity }

  it { should have_many :user_events }

  it { should have_many(:users).through(:user_events) }

end
