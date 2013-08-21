class Mentor < User
  has_many :availabilities
  has_many :appointments
end
