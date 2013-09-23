class AppointmentsController < ApplicationController
  def create
    mentee = User.find(params[:mentee_id])
    mentor = User.find_by_activation_code(params[:code])
    availability = mentor.availabilities.find_by_id(params[:availability_id])

    if availability
      appointment = Appointment.create!(:mentee => mentee, :mentor => mentor, :availability => availability)
      mentee.send_appointment_confirmation(appointment)
      flash[:notice] = "An appointment has been created for you and #{mentee.name}. Enjoy!"
    else
      flash[:notice] = "This time is no longer available. Please create more availability."
    end

    redirect_to edit_user_path(mentor.activation_code)
  end
end
