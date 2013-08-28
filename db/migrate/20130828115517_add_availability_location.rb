class AddAvailabilityLocation < ActiveRecord::Migration
  def change
    add_column :availabilities, :location, :string
  end
end
