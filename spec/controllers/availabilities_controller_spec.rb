require 'spec_helper'

describe AvailabilitiesController do
  describe "#create" do
    let(:availability) { FactoryGirl.create(:availability) }
    let(:mentor) { FactoryGirl.create(:mentor) }

    it "creates a new availability given params" do
      expect{ post :create, :availability => {
                              :start_time => DateTime.new(2013, 1, 1) },
                              :email => mentor.email }.to change{Availability.count}.by(1)
    end
  end
end
