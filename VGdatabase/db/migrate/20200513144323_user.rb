class User < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string "email"
      t.string "username"
      t.string "password"
      t.string "avatar"
      t.integer "google_token", limit: 16
      t.string "google_username"
      t.string "steam_username"
      t.integer "steam_token"
    end
  end
end
