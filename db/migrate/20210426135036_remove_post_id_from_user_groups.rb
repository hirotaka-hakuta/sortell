class RemovePostIdFromUserGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_groups, :post_id, :integer
  end
end
