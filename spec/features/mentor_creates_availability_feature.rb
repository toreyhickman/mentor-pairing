require 'spec_helper'

feature "Mentor creates availability" do
  context "when the mentor provides valid input" do
    it "persists the availability to the database" do
      mentor = FactoryGirl.create(:mentor)

      visit new_availability_path
      fill_in :first_name, with: mentor.first_name
      fill_in :last_name, with: mentor.last_name
      fill_in :email, with: mentor.email
      fill_in :twitter_handle, with: mentor.twitter_handle
      fill_in :duration, with: 60


      mentoring_time = 1.week.from_now
      select_datetime(mentoring_time, :availability_start_time)

      click_on :submit_availability

      expect(page).to have_content "#{mentor.name} on #{mentoring_time.strftime("%m/%d/%Y")}"
    end
  end
end
