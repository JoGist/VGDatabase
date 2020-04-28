class Friend < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
        t.references 'user'
        t.references 'friend'
        t.string 'favorite'

        t.timestamps
    end
  end
end
