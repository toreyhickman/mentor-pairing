class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def find_or_activate_by_email
    user = User.find_by_email(params[:email])
    if user
      user.update_attributes(user_params)
    else
      user = User.create!(user_params).send_activation
      flash[:notice] = "Please go check your email, ok?"
    end
    user
  end

  def user_params
    [:first_name, :last_name, :twitter_handle, :email, :bio, :interests, :gravatar_url].inject({}) { |hash, attribute| hash.merge(attribute => params[attribute]) }
  end

end
