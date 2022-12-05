class RemovePostFromCommunity < ActiveRecord::Migration[7.0]
  def change
    remove_column :communities, :post_id
  end
end
