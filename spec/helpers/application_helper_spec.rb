require 'spec_helper'
class FakeApplicationHelper
  include ApplicationHelper

end

describe ApplicationHelper do
  subject(:helper) { FakeApplicationHelper.new }
  def stub_link_to(symbol, date, value)
    helper.stub(:link_to).with(symbol, month: date.strftime("%Y-%m-01")).and_return(value)
  end
  context "month_link" do
    before :each do
      @date = DateTime.new(2013, 1, 1)
    end
    it "links to the previous month" do
      stub_link_to("<", @date.beginning_of_month - 1, "previous_month_link")
      link = helper.month_link("<", @date.beginning_of_month - 1)
      expect(link).to eq("previous_month_link")
    end

    it "links to the next month" do
      stub_link_to(">", @date.end_of_month + 1, "next_month_link")
      link = helper.month_link(">", @date.end_of_month + 1)
      expect(link).to eq("next_month_link")
    end
  end
end
