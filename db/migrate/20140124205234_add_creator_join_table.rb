class AddCreatorJoinTable < ActiveRecord::Migration
  def up
    add_column :events, :creator, :integer, null: false
  end

  def down
    remove_column :events, :creator
  end
end
