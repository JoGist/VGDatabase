class Drop < ActiveRecord::Migration[5.1]
  def up
    drop_table :gioco_reviews
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
