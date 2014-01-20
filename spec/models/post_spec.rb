require 'spec_helper'

describe Post do

  it { should belong_to :user }

  it { should have_valid(:message).when('Here is a comment') }
  it { should_not have_valid(:message).when(nil, '') }

end
