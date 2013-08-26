class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.datetime      :start_time
      t.datetime      :end_time
      t.date          :date
      t.references    :mentor

      t.timestamps
    end
  end
end
