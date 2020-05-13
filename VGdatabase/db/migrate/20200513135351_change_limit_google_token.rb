class ChangeLimitGoogleToken < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :google_token, :integer, limit: 16
  end
end
