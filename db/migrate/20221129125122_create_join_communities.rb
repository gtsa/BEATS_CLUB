class CreateJoinCommunities < ActiveRecord::Migration[7.0]
  def change
    create_table :join_communities do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :community, null: false, foreign_key: true

      t.timestamps
    end
  end
end
