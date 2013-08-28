class AvailabilitiesController < ApplicationController

  def new
    @availability = Availability.new(:location => "Dev Bootcamp")
  end

  def create
    mentor = User.find_by_email(params[:email])
    unless mentor
      mentor = User.create!(mentor_params).send_activation
      flash[:notice] = "Please go check your email, ok?"
    end
    mentor.availabilities.create!(params[:availability])
    redirect_to availabilities_path
  end

  def index
    @availabilities = Availability.visible.order(:start_time)
    @appointments = Appointment.visible.order(:start_time)
  end

  def destroy
    Availability.destroy(params[:id])
    redirect_to :back
  end

  private

  def mentor_params
    [:first_name, :last_name, :twitter_handle, :email].inject({}) { |hash, attribute| hash.merge(attribute => params[attribute]) }
  end
end
