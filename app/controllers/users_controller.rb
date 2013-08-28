class UsersController < ApplicationController
  def edit
    @mentor = Mentor.find_by_activation_code(params[:id])
  end
end
