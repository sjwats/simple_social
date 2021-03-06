require 'spec_helper'

describe UserEvent do
  it { should validate_presence_of :user }

  it { should validate_presence_of :event }

  it { should belong_to :user }
  it { should belong_to :event }


end
