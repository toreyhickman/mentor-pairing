class UserMailer < ActionMailer::Base
  default from: "chicago.lead.mentor@devbootcamp.com"

  def mentor_activation(mentor)
    @mentor = mentor

    @url = "http://pairing-is-caring.herokuapp.com/activations/" + mentor.activation_code + "/mentor"

    mail(:to => mentor.email, :subject => "Please confirm that you're an actual mentor/person")
  end
end
