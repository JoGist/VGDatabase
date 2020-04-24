class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references 'user'
      t.references 'game'
      t.integer 'score'
      t.text 'comments'
      end
  end
end
