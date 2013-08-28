class Mentor < User
  has_many :availabilities
  has_many :appointments

  before_create :create_activation_code

  def name
    [first_name, last_name].compact.join(" ")
  end

  def send_activation
    UserMailer.mentor_activation(self).deliver
    self
  end

  private

  def create_activation_code
    self.activation_code = Digest::MD5.hexdigest(rand.to_s + Time.now.to_s + twitter_handle)
  end
end
