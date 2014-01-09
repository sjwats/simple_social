class RemoveColsUserevent < ActiveRecord::Migration
  def up
    remove_column :user_events, :users_event_role
    remove_column :user_events, :users_attend_status
  end

  def down
    add_column :user_events, :users_event_role, :string
    add_column :user_events, :users_attend_status, :string
  end
end
