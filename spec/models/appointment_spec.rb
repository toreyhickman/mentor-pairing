require 'spec_helper'

describe Appointment do
  it { should belong_to(:mentor) }
  it { should belong_to(:mentee) }
end
