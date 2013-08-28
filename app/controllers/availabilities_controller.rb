class AvailabilitiesController < ApplicationController

  def new
    @availability = Availability.new
  end

  def create
    mentor = Mentor.find_by_email(params[:email])
    mentor ||= Mentor.create!(safe_params).send_activation
    mentor.availabilities.create!(params[:availability].merge(:duration => params[:duration]))
    flash[:notice] = "Please go check your email, ok?"
    redirect_to availabilities_path
  end

  def index
    @availabilities = Availability.visible.order(:start_time).all
  end

  def destroy
    Availability.destroy(params[:id])
    redirect_to :back
  end

  private

  def safe_params
    [:first_name, :last_name, :twitter_handle, :email].inject({}) { |hash, attribute| hash.merge(attribute => params[attribute]) }
  end
end
