class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :title
      t.integer :serial
      t.string :developer
      t.string :platform
      t.integer :score
      t.timestamp :release_date
      t.string :cover

      t.timestamps
    end
  end
end
