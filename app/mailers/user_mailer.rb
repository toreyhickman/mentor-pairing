class UserMailer < ActionMailer::Base
  default from: "chicago.lead.mentor@devbootcamp.com"
  add_template_helper(ApplicationHelper)

  def user_activation(user)
    @user = user

    @url = "http://pairing-is-caring.herokuapp.com/activations/" + user.activation_code + "/user"

    mail(:to => user.email, :subject => "Please confirm that you're an actual person")
  end

  def appointment_request(availability, mentee)
    @availability = availability
    @mentor = availability.mentor
    @mentee = mentee

    @url = "http://pairing-is-caring.herokuapp.com/appointments/" + @mentor.activation_code + "/create?mentee_id=#{@mentee.id}&availability_id=#{@availability.id}"

    mail(:to => @mentor.email, :subject => "#{@mentee.name} has requested to learn with you")
  end
end
