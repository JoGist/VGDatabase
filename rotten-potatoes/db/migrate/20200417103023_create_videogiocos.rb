class CreateVideogiocos < ActiveRecord::Migration[5.1]
  def change
    create_table :videogiocos do |t|
      t.integer :serial_number
      t.string :titolo
      t.string :sviluppatore
      t.string :genere
      t.string :piattaforma
      t.integer :valutazione
      t.timestamp :anno_pubblicazione
      t.string :img_cover
      t.string :link_acquisto

      t.timestamps
    end
  end
end
