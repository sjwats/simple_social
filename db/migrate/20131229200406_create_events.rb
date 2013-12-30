class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date, null:false
      t.time :start_time, null:false
      t.time :end_time
      t.string :location_name
      t.string :street_address
      t.string :city, null:false
      t.string :state, null:false
      t.integer :num_attendees_requested
      t.text :description, null:false
      t.boolean :status, null:false
      t.integer :activity_id, null:false

      t.timestamps
    end
  end
end
