require 'spec_helper'

describe AvailabilitiesController do
  describe "#create" do
    let(:availability) { FactoryGirl.create(:availability) }
    let(:mentor) { FactoryGirl.create(:mentor) }

    it "creates a new availability given params" do
      expect{ post :create, :availability => {
                              :date => Date.today,
                              :start_time => Time.new(2013, 1, 1) },
                              :mentor_id => availability.mentor.id }.to change{Availability.count}.by(2)
    end

    it "includes an error message when invalid params are posted" do
      post :create, :availability => {
                              :start_time => Time.new(2013, 1, 1) },
                              :mentor_id => availability.mentor.id

      expect(JSON.parse(response.body)["message"]).to eq("Error")
    end

  end
end
