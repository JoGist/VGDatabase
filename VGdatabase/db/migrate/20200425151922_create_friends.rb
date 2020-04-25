class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
        t.belongs_to :user
        t.belongs_to :friend
    end
  end
end
