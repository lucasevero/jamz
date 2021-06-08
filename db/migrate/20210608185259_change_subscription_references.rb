class ChangeSubscriptionReferences < ActiveRecord::Migration[6.0]
  def change
    rename_column :subscriptions, :groups_id, :group_id
    rename_column :subscriptions, :users_id, :user_id
  end
end
