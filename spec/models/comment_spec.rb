require 'spec_helper'

describe Comment do

  it { should belong_to :event }

  it { should have_valid(:body).when('Here is a comment') }
  it { should_not have_valid(:body).when(nil, '') }

  it { should have_valid(:name).when('Name') }
  it { should_not have_valid(:name).when(nil, '') }

end
