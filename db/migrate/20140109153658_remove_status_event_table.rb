class RemoveStatusEventTable < ActiveRecord::Migration
  def up
    remove_column :events, :status
  end

  def down
    add_column :events, :status, :string
  end
end
