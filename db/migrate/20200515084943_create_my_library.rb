class CreateMyLibrary < ActiveRecord::Migration[5.2]
  def change
    create_table :mylibraries do |t|
      t.references 'game'
      t.references 'user'
      t.string 'favorite'
    end
  end
end
