class RemoveAttendeeEvents < ActiveRecord::Migration
  def up
    remove_column :events, :attendee_count
    add_column :events, :user_events_count, :integer, default: 0
  end

  def down
    add_column :events, :attendee_count, :integer, default: 0
    remove_column :events, :user_events_count
  end
end
