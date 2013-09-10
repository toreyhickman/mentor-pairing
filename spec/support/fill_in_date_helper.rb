module SelectDateTimeHelper
  def select_datetime(datetime, field)
    fill_in :availability_start_time_1s, with: datetime.strftime("%Y-%m-%d")
    {
      "4i" => (lambda { |dt| dt.strftime("%H") }),
      "5i" => (lambda { |dt| dt.strftime("%M") })
    }.each do |sub_field, translation|
      select translation.call(datetime), from: "#{field}_#{sub_field}"
    end
  end
end

module RSpec::Rails::FeatureExampleGroup
  include SelectDateTimeHelper
end
