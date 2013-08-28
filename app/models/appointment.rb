class Appointment < ActiveRecord::Base
  attr_accessible :date, :end_time, :mentee, :mentor, :start_time, :availability
  attr_accessor :availability

  belongs_to :mentor
  belongs_to :mentee

  validates :mentor_id, :presence => true, :uniqueness => {:scope => [:mentee_id, :date]}
  validates :mentee, :presence => true

  before_save :parse_availability
  after_create :kill_availability
  
  private

  def parse_availability
    self.start_time = availability.start_time
    self.end_time   = availability.end_time
    self.date       = availability.date
  end
  
  def kill_availability
    availability.destroy
  end
end
