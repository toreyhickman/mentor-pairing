class Availability < ActiveRecord::Base
  attr_accessible :start_time, :duration, :timezone, :location
  attr_accessor :duration
  belongs_to :mentor

  validates :start_time, :presence => true

  before_save :adjust_for_timezone
  before_save :set_end_time

  scope :visible, Proc.new {
    includes(:mentor).
    where("users.activated" => true).
    where("start_time > ?", Time.now)
  }

  def mentor_name
    mentor.name
  end

  def mentor_twitter
    mentor.twitter_handle
  end

  private

  def adjust_for_timezone
    adjusted_time = start_time.strftime("%Y/%m/%d %I:%M%P #{timezone}")
    self.start_time = Time.parse(adjusted_time)
  end

  def set_end_time
    self.end_time = self.start_time + self.duration.to_i*60
  end

end
