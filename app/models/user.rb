class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :type, :twitter_handle
end
