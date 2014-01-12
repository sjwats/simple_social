class AddForeignKeyComments < ActiveRecord::Migration
  def up
    add_column :comments, :event_id, :integer, null: false
  end

  def down
    remove_column :comments, :event_id
  end
end
