class ChangeIntegerLimitReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :id, :integer, limit: 16
    change_column :reviews, :user_id, :integer, limit: 16
  end
end
