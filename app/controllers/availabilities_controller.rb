class AvailabilitiesController < ApplicationController

  def new
    @availability = Availability.new(:location => "Dev Bootcamp")
  end

  def create
    mentor = find_or_activate_by_email
    mentor.availabilities.create!(format_start_time(availability_params))
    redirect_to availabilities_path
  end

  def index
    @availabilities = Availability.visible.order(:start_time)
    @appointments = Appointment.visible.order(:start_time)
    @featured = User.featured_mentors
  end

  def destroy
    Availability.destroy(params[:id])
    redirect_to :back
  end

  private

  def availability_params
    params.require(:availability).permit('start_time(1s)', 'start_time(4i)', 'start_time(5i)', :start_time, :duration, :timezone, :location)
  end

  def format_start_time(time_params)
    return time_params unless time_params['start_time(1s)']
    new_time_params = time_params.clone
    year, month, day = new_time_params.delete('start_time(1s)').split('-')
    new_time_params['start_time(1i)'] = year
    new_time_params['start_time(2i)'] = month
    new_time_params['start_time(3i)'] = day
    new_time_params
  end
end
