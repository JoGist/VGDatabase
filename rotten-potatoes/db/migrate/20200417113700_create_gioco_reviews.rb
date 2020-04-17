class CreateGiocoReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :gioco_reviews do |t|
      t.references :'users'
      t.references :'videogiocos'
      t.integer :valutazione
      t.string :commento

      t.timestamps
    end
  end
end
