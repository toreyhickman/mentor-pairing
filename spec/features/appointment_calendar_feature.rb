require 'spec_helper'

feature "Calendar" do
  context "when the mentor has appointments" do
    it "diplays the appointments on the calendar day" do
      appointment = FactoryGirl.create(:appointment, availability: FactoryGirl.create(:availability, :start_time => DateTime.now, :duration => 1))
      visit edit_user_path(appointment.mentor.activation_code)
      within("#calendar") do
        page.should have_css(".mentee_name", :text => appointment.mentee.name)
      end
    end
  end

  context "when the mentor has no appointments" do
    it "displays no appointments on the calendar" do
      mentor = FactoryGirl.create(:mentor)
      visit edit_user_path(mentor.activation_code)
      within("#calendar") do
        page.should_not have_css(".mentor_name")
      end
    end
  end

end
