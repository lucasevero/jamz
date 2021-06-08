class ChangeGroupReferences < ActiveRecord::Migration[6.0]
  def change
    rename_column :groups, :users_id, :user_id
  end
end
