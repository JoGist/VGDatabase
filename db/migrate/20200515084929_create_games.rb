class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.integer :serial
      t.string :developer
      t.string :platform
      t.integer :score
      t.string :genre
      t.timestamp :release_date
      t.string :cover
      t.string :plot
    end
  end
end
