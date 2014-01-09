class AddDatetimeEvents < ActiveRecord::Migration
  def up
    add_column :events, :start_time, :datetime, null: false
    add_column :events, :end_time, :datetime, null: false
  end

  def down
    remove_column :events, :start_time
    remove_column :events, :end_time
  end
end
