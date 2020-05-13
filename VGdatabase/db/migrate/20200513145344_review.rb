class Review < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references 'user'
      t.references 'game'
      t.integer 'score'
      t.text 'comments'
      end
  end
end
