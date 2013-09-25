class UniqueUserEmails < ActiveRecord::Migration
  def change

    # First pass to destroy unactivated copies of activated users
    users_by_email = User.all.group_by(&:email)
    users_by_email.each do |email, users|
      if users.any?(&:activated?)
        users.reject(&:activated?).each(&:destroy)
      end
    end

    # Second pass to ensure there's one and only one user per email address
    users_by_email = User.all.group_by(&:email)
    users_by_email.each do |email, users|
      first_version = users.shift
      users.each(&:destroy)
    end

    add_index :users, :email, :unique => true
  end
end
