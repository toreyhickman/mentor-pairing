require 'spec_helper'

describe AppointmentsController do
  describe "#create" do
    it "creates a new appointment" do
      availability = FactoryGirl.create(:availability)
      mentor = availability.mentor
      mentee = FactoryGirl.create(:mentee)

      expect {
        post :create, code: mentor.activation_code, mentee_id: mentee.id, availability_id: availability.id
      }.to change{Appointment.count}.by(1)
    end

    it "does not create a new appointment if availability no longer exists" do
      mentor = FactoryGirl.create(:mentor)
      mentee = FactoryGirl.create(:mentee)

      expect {
        post :create, code: mentor.activation_code, mentee_id: mentee.id, availability_id: "42"*4
      }.not_to change{Appointment.count}
    end
  end
end
