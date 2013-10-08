require 'spec_helper'

describe User do
  it { should have_many(:mentoring_appointments) }
  it { should have_many(:menteeing_appointments) }
  it { should have_many(:availabilities) }
  it { should have_many(:received_kudos) }
  it { should have_many(:given_kudos) }
end
