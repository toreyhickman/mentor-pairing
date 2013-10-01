class AddUserKudosCache < ActiveRecord::Migration
  def change
    add_column :users, :total_kudos, :integer, default: 0
    add_column :users, :total_given_kudos, :integer, default: 0
  end
end
