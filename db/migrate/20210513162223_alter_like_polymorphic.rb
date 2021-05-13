class AlterLikePolymorphic < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :gossip_id
    remove_column :likes, :comment_id
    add_column :likes, :like_target_id, :integer
    add_column :likes, :like_target_type, :string
  end
end
