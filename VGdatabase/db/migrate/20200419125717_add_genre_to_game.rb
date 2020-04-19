class AddGenreToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :genre, :string
  end
end
