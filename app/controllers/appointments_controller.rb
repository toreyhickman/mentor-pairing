class AppointmentsController < ApplicationController
  def new
    @availability = Availability.find_by_id(params[:availability_id])
    return redirect_to availabilities_path unless @availability.present?
  end

  def create
    raise params.inspect
  end
end