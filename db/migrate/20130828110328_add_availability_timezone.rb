class AddAvailabilityTimezone < ActiveRecord::Migration
  def change
    add_column :availabilities, :timezone, :string
  end
end
