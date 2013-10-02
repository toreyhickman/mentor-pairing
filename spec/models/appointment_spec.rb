require 'spec_helper'

describe Appointment do
  it { should belong_to(:mentor) }
  it { should belong_to(:mentee) }
  it { should have_many(:kudos) }

  describe "when first created" do
    before(:each) do
      @mentor = FactoryGirl.create(:mentor)
      @mentee = FactoryGirl.create(:mentee)
      @start_time = DateTime.new(2013, 1, 1)
      availability_attributes = FactoryGirl.attributes_for(:availability, start_time: @start_time)
      @availability = @mentor.availabilities.create(availability_attributes)
      @appointment = Appointment.create(:mentor => @mentor, :mentee => @mentee, :availability => @availability)
    end

    context "with only a mentor" do
      it "should not be valid" do
        invalid_appointment = @mentor.mentoring_appointments.build
        expect(invalid_appointment.valid?).to eq(false)
      end
    end

    context "when created with a mentor and mentee" do
      context "passing in an availability object" do
        it "should have a start_time equal to that of the availability object passed to it" do
          expect(@appointment.start_time).to eq(@availability.start_time)
        end

        it "should have an end_time equal to that of the availability object passed to it" do
          expect(@appointment.end_time).to eq(@availability.end_time)
        end

        it "should create a kudo object" do
          expect(@appointment.mentor.received_kudos.count).to eq(1)
        end
      end

    end

  end

end
