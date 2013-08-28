class UsersController < ApplicationController
  def edit
    @mentor = User.find_by_activation_code(params[:id])
    @availabilities = @mentor.availabilities.visible.order(:start_time)
  end
end
