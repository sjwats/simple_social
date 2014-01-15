class AddProfileInfoUser < ActiveRecord::Migration
  def up
    add_column :users, :date_of_birth, :date
    add_column :users, :about_me, :text
    add_column :users, :home_town, :string
    add_column :users, :current_location, :string
    add_column :users, :image, :string
  end

  def down
    remove_column :users, :date_of_birth
    remove_column :users, :about_me
    remove_column :users, :home_town
    remove_column :users, :current_location
    remove_column :users, :image, :string
  end
end
