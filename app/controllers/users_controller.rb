class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find_by_activation_code(params[:id])
    @availabilities = @user.availabilities.visible.order(:start_time)
    @menteeing_appointments = @user.menteeing_appointments.order(:start_time)
    @mentoring_appointments = @user.mentoring_appointments.order(:start_time)
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
  end

  def find_mentor
      user = User.find_by_email(params[:email])

      respond_to do |format|
        format.json do
          if user
            render :json => { :first_name => user.first_name,
                              :last_name => user.last_name,
                              :twitter_handle => user.twitter_handle,
                              :bio => user.bio,
                              :interests => user.interests}
          else
            render :json => { :no_user => true }
          end
        end
      end
  end
end
