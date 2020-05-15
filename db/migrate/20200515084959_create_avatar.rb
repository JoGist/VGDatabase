class CreateAvatar < ActiveRecord::Migration[5.2]
  def change
    create_table :avatars do |t|
      t.string :avatar
    end
  end
end
