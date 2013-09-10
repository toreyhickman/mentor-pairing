require 'spec_helper'

describe AvailabilitiesController do
  describe "#create" do
    let(:availability) { FactoryGirl.create(:availability) }
    let(:mentor) { FactoryGirl.create(:mentor) }

    it "creates a new availability given params" do
      expect {
        post :create, email: mentor.email, availability: FactoryGirl.attributes_for(:availability)
      }.to change{Availability.count}.by(1)
    end
  end
end
