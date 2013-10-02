class AppointmentRequest < ActiveRecord::Base
  belongs_to :mentee, :class_name => "User"
  belongs_to :availability

  validates_presence_of :mentee_id, :availability_id
end