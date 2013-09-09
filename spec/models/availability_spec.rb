require "spec_helper"

describe Availability do
  it { should belong_to(:mentor) }

  describe "when first created" do
    before(:each) do
      @start_time = DateTime.new(2013, 1, 1)
      @availability = FactoryGirl.create(:availability, start_time: @start_time)
    end

    it "should have a start_time" do
      expect(@availability.start_time).to eq(@start_time)
    end

    it "should have an end_time which is the duration times 60" do
      expect(@availability.end_time).to eq(@availability.start_time + 1800)
    end

    context "length" do
      it "should be 30 minutes long" do
        expect(@availability.end_time - @availability.start_time).to eq(1800)
      end
    end
  end
end
