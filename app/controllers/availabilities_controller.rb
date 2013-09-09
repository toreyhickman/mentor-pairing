class AvailabilitiesController < ApplicationController

  def new
    @availability = Availability.new(:location => "Dev Bootcamp")
  end

  def create
    mentor = find_or_activate_by_email
    mentor.availabilities.create!(params[:availability])
    redirect_to availabilities_path
  end

  def index
    @availabilities = Availability.visible.order(:start_time)
    @appointments = Appointment.visible.order(:start_time)
    @featured = User.all.uniq.sort_by(&:name)
  end

  def destroy
    Availability.destroy(params[:id])
    redirect_to :back
  end
end
