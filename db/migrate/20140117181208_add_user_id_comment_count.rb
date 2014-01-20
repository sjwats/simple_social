class AddUserIdCommentCount < ActiveRecord::Migration
  def up
    add_column :comments, :user_id, :integer
    add_column :events, :comments_count, :integer, default: 0

  end

  def down
    remove_column :comments, :user_id
    remove_column :events, :comments_count
  end
end
