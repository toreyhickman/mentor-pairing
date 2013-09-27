require 'spec_helper'

describe UsersController do

  describe "#find_mentor" do
    let(:mentor) { FactoryGirl.create(:user) }

    context "xhr request" do

      context "with email found in the database" do

        it "returns JSON object with mentors attributes" do
          expected = { :first_name => mentor.first_name,
                       :last_name => mentor.last_name,
                       :twitter_handle => mentor.twitter_handle,
                       :bio => mentor.bio,
                       :interests => mentor.interests }.to_json

          xhr :post, :find_mentor, email: mentor.email, :format => :json
          response.body.should eq expected
        end
      end

      context "without email found in the database" do

        it "returns JSON object with no_user property equal to true" do
          xhr :post, :find_mentor, email: "something_not_found", :format => :json
          response.body.should eq ( { :no_user => true }.to_json)
        end
      end
    end
  end
end
