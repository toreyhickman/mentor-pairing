class Availability < ActiveRecord::Base
  attr_accessible :start_time, :duration, :timezone, :location
  belongs_to :mentor, :class_name => "User"

  validates :start_time, :presence => true

  before_save :adjust_for_timezone
  before_save :set_end_time

  scope :visible, Proc.new {
    includes(:mentor).
    where("users.activated" => true).
    where("start_time > ?", Time.now)
  }


  def duration
    30
  end

  private

  def adjust_for_timezone
    self.start_time = ActiveSupport::TimeZone.find_tzinfo(timezone).local_to_utc(start_time)
  end

  def set_end_time
    self.end_time = self.start_time + self.duration.to_i*60
  end

end
