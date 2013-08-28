class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references  :mentor
      t.references  :mentee
      t.datetime    :start_time
      t.datetime    :end_time
      t.string      :timezone
      t.string      :location

      t.timestamps
    end
  end
end
