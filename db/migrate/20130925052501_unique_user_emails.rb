class UniqueUserEmails < ActiveRecord::Migration
  def up

    ensure_unique_users!

    add_index :users, :email, :unique => true
  end

  def down
    remove_index :users, :email
  end

  def ensure_unique_users!
    delete_inactive_copies_of_activated_users!
    delete_copies_for_all_users!
  end

  def delete_copies_for_all_users!
    users_by_email = load_users.group_by { |u| u["email"] }

    users_by_email.each do |email, users|
      first_version = users.shift
      users.each(&method(:destroy_user))
    end
  end

  def delete_inactive_copies_of_activated_users!
    users_by_email = load_users.group_by { |u| u["email"] }
    users_by_email.each do |email, users|
      if users.any?(&method(:activated?))
        users.reject(&method(:activated?)).each(&method(:destroy_user))
      end
    end
  end

  def destroy_user(u)
    execute "DELETE FROM users WHERE users.id=#{u["id"]}"
  end


  def load_users
    execute <<-SQL
      SELECT * FROM users
    SQL
  end



  def activated?(u)
    u["activated"] == "t"
  end

end
