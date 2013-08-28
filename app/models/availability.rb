class Availability < ActiveRecord::Base
  attr_accessible :start_time, :duration
  attr_accessor :duration
  belongs_to :mentor

  validates :start_time, :presence => true

  before_save :set_end_time

  scope :visible, -> { includes(:mentor).where("users.activated" => true) }

  def mentor_name
    mentor.name
  end

  def mentor_twitter
    mentor.twitter_handle
  end

  private

  def set_end_time
    self.end_time = self.start_time + self.duration.to_i*60
  end

end
