class AppointmentsController < ApplicationController
  def create
    mentee = User.find(params[:mentee_id])
    mentor = User.find_by_activation_code(params[:code])
    availability = mentor.availabilities.find(params[:availability_id])

    Appointment.create!(:mentee => mentee, :mentor => mentor, :availability => availability)

    flash[:notice] = "An appointment has been created for you and #{mentee.name}. Enjoy!"

    redirect_to edit_user_path(mentor.activation_code)
  end
end