class AvailabilitiesController < ApplicationController

  def new
    @availability = Availability.new
  end

  def create
    mentor = Mentor.find(params[:mentor_id])
    availability = Availability.new(params[:availability])
    if availability.save
      mentor.availabilities << availability
      render :json => "Success"
    else
      render :json => "Error"
    end
  end

  def show
    @availability = Availability.find(params[:id])
  end

end
