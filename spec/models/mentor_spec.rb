require 'spec_helper'

describe Mentor do
  it { should have_many(:appointments) }
  it { should have_many(:availabilities) }
end
