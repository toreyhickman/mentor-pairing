class ActivationsController < ApplicationController
  def mentor
    mentor = Mentor.find_by_activation_code(params[:code])
    if mentor
      mentor.update_attribute(:activated, true)
      flash[:notice] = "Congrats, you are a real person!"
    else
      raise "Mentor not found by #{params[:code]}"
    end
    redirect_to edit_user_path(mentor.activation_code)
  end
end