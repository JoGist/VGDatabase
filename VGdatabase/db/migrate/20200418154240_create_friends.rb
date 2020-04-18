class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.references "user_id"
      t.references "friend_id"
      t.string "favorite"

      t.timestamps
    end
  end
end
