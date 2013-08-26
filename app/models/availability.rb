class Availability < ActiveRecord::Base
  attr_accessible :start_time, :end_time, :date
  belongs_to :mentor

  before_save :set_end_time

  private

  def set_end_time
    self.end_time = start_time + 1800
  end

end
