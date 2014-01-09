class ChangeToDatetimeEvent < ActiveRecord::Migration
  def up
    remove_column :events, :start_time
    remove_column :events, :end_time
    remove_column :events, :date
  end

  def down
    add_column :events, :start_time, :datetime
    add_column :events, :end_time, :datetime
    add_column :events, :date, :date
  end
end
