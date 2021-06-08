class ChangePostReferences < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :users_id, :user_id
    rename_column :posts, :groups_id, :group_id
  end
end
