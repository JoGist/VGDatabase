class CreateMoviegoers < ActiveRecord::Migration[5.1]
  def change
    create_table :moviegoers do |t|
      t.string :name
      t.string :string
      t.string :provider
      t.string :string
      t.string :uid
      t.string :string

      t.timestamps
    end
  end
end
