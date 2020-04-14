class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
        t.integer :vote
        t.text :comments
        t.references :moviegoer
        t.references :movie
    end
  end
end
