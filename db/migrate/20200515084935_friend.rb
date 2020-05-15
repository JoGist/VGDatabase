class Friend < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.references 'user'
      t.references 'friend'
      t.string 'favorite'
    end
  end
end
