class CreateAppointmentRequests < ActiveRecord::Migration
  def change
    create_table :appointment_requests do |t|
      t.integer :availability_id
      t.integer :mentee_id
      t.timestamps
    end
  end
end
