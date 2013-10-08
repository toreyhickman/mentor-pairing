class CreateKudos < ActiveRecord::Migration
  def change
    create_table :kudos do |t|
      t.integer :appointment_id
      t.integer :mentor_id
      t.integer :mentee_id
      t.integer :points
      t.timestamps
    end
  end
end
