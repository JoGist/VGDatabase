class ChangeGoogleRefresh < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :google_refresh_token, :steam_token
  end
end
