class Availability < ActiveRecord::Base
  attr_accessible :start_time, :end_time
  belongs_to :mentor
end
