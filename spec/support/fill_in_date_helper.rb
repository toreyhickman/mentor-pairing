module SelectDateTimeHelper
  def select_datetime(datetime, field)
    {
      "1i" => (lambda { |dt| dt.year           }),
      "2i" => (lambda { |dt| dt.strftime("%B") }),
      "3i" => (lambda { |dt| dt.day            }),
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
