class User < ActiveRecord::Base
  attr_accessible :cohort, :email, :first_name, :last_name, :password_digest, :type, :twitter_handle
end
