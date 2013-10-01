class Kudo < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :mentor, class_name: 'User'
  belongs_to :mentee, class_name: 'User'

  validates_presence_of :mentor_id

  after_initialize :set_default_points
  after_create :add_mentor_kudo, :add_mentee_given_kudo

  private

  def set_default_points
    self.points ||= 5
  end

  def add_mentor_kudo
    self.mentor.total_kudos += self.points
    self.mentor.save
  end

  def add_mentee_given_kudo
    self.mentee.total_given_kudos += self.points
    self.mentee.save
  end
end
