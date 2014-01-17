class AddAttendeeCountToEvents < ActiveRecord::Migration
  def up
    add_column :events, :attendee_count, :integer, default: 0
  end

  def down
    remove_column :events, :attendee_count
  end
end
