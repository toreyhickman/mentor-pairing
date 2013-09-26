require 'spec_helper'

describe AppointmentRequestsController do
  describe "#create" do
    it "creates a new user if user doesn't exist and given params" do
      expect {
        post :create, email: "erik@example.com", :first_name => "Erik", :last_name => "Allar", :twitter_handle => "erik"
      }.to change{User.count}.by(1)
    end

    it "does not create a new user if user is exists but is unactivated" do
      user = FactoryGirl.create(:mentor, :activated => false)
      expect {
        post :create, email: user.email, :first_name => "Erik", :last_name => "Allar", :twitter_handle => "erik"
      }.not_to change{User.count}.by(1)
    end
  end
end
