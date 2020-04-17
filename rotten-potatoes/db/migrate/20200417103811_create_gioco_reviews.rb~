class CreateGiocoReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :gioco_reviews do |t|
      t.integer :utente_id
      t.integer :gioco_serial_number
      t.integer :valutazione
      t.string :descrizione

      t.index ["utente_id"], name: "index_reviews_on_user_id"
      t.index ["gioco_serial_number"], name: "index_reviews_on_videogiocos_id"

      t.timestamps
    end
  end
end
