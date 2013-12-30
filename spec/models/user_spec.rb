require 'spec_helper'

describe User do
  it { should have_many :user_events }
  it { should have_many(:events).through(:user_events) }
  it { should have_many :user_activities }
  it { should have_many(:activities).through(:user_activities) }

end
