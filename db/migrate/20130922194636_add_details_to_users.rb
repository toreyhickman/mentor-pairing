class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text
    add_column :users, :interests, :string
    add_column :users, :gravatar_url, :string
  end
end
