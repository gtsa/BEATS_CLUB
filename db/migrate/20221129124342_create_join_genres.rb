class CreateJoinGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :join_genres do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
