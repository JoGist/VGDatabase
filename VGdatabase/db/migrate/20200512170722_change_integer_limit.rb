class ChangeIntegerLimit < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :id, :integer, limit: 16
  end
end
