class UsersController < ApplicationController
  require 'json'

  def show
    @user = User.find(params[:id])
  end

  def edit
    @mentor = User.find_by_activation_code(params[:id])
    @availabilities = @mentor.availabilities.visible.order(:start_time)
    @menteeing_appointments = @mentor.menteeing_appointments.visible.order(:start_time)
    @mentoring_appointments = @mentor.mentoring_appointments.visible.order(:start_time)
  end

  def find_mentor
      user = User.find_by_email(params[:email])

      respond_to do |format|
        format.json do
          if user
            render :json => { :first_name => user.first_name,
                              :last_name => user.last_name,
                              :twitter_handle => user.twitter_handle }
          else
            render :json => { :no_user => true }
          end
        end
      end
  end
end
