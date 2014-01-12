class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.string :name

      t.timestamps
    end
  end
end
