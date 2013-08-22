class Appointment < ActiveRecord::Base
  attr_accessible :date, :end_time, :mentee_id, :mentor_id, :start_time

  belongs_to :mentor
  belongs_to :mentee
end
