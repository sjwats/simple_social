class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :poster_id
      t.text :message, null: false

      t.timestamps
    end
  end
end
