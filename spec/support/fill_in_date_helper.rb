module SelectDateTimeHelper
  def select_datetime(datetime, field)
    {
      "1i" => -> (dt) { dt.year           },
      "2i" => -> (dt) { dt.strftime("%B") },
      "3i" => -> (dt) { dt.day            },
      "4i" => -> (dt) { dt.strftime("%H") },
      "5i" => -> (dt) { dt.strftime("%M") }
    }.each do |sub_field, translation|
      select translation.call(datetime), from: "#{field}_#{sub_field}"
    end
  end
end

module RSpec::Rails::FeatureExampleGroup
  include SelectDateTimeHelper
end
