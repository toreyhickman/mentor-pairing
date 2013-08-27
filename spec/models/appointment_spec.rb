require 'spec_helper'

describe Appointment do
  it { should belong_to(:mentor) }
  it { should belong_to(:mentee) }

  describe "when first created" do
    before(:each) do
      @mentor = Mentor.create
      @mentee = Mentee.create
      @start_time = Time.new(2013, 1, 1)
      @availability = @mentor.availabilities.create(:start_time => @start_time, :date => Date.today)
      @appointment = Appointment.create(:mentor => @mentor, :mentee => @mentee, :availability => @availability)
    end

    context "with only a mentor" do
      it "should not be valid" do
        invalid_appointment = @mentor.appointments.build
        expect(invalid_appointment.valid?).to eq(false)
      end
    end

    context "when created with a mentor and mentee" do
      it "should not allow duplicate appointments on the same day" do
        appointment2 = Appointment.create(:mentor => @mentor, :mentee => @mentee, :date => Date.today)
        expect(appointment2.valid?).to eq(false)
      end

      context "passing in an availability object" do
        it "should have a start_time equal to that of the availability object passed to it" do
          expect(@appointment.start_time).to eq(@availability.start_time)
        end

        it "should have an end_time equal to that of the availability object passed to it" do
          expect(@appointment.end_time).to eq(@availability.end_time)
        end

        it "should have a date equal to that of the availability object passed to it" do
          expect(@appointment.date).to eq(@availability.date)
        end
      end

    end

  end

end
