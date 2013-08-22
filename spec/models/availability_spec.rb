require "spec_helper"

describe Availability do
  it { should belong_to(:mentor) }

  describe "when first created" do
    before(:each) do
      @start_time = Time.new(2013, 1, 1)
      @end_time = Time.new(2013, 1, 1) + 1800
      @availability = Availability.create(:start_time => @start_time , :end_time => @end_time)
    end

    it "should have a start_time" do
      expect(@availability.start_time).to eq(@start_time)
    end

    it "should have an end_time" do
      expect(@availability.end_time).to eq(@end_time)
    end

    context "length" do
      it "should be 30 minutes long" do
        expect(@availability.end_time - @availability.start_time).to eq(1800)
      end
    end
  end
end
