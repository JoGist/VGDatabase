class AddUsernamesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :steam_username, :string
    add_column :users, :google_username, :string
  end
end
