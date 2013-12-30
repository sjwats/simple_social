require 'spec_helper'

describe Activity do
  it { should have_valid(:name).when("Soccer", "Polish Horseshoes") }
  it { should_not have_valid(:name).when(nil, '') }
  it { should validate_uniqueness_of :name }

  it { should have_many(:user_activities) }

  it { should have_many(:users).through(:user_activities) }

  it { should have_many(:events) }

end
