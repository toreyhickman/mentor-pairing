class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :mentor_id
      t.integer :mentee_id
      t.time :start_time
      t.time :end_time
      t.date :date

      t.timestamps
    end
  end
end
