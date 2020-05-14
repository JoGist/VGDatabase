class AddFavoriteToFriend < ActiveRecord::Migration[5.1]
  def change
    add_column :friends, :favorite, :string
  end
end
