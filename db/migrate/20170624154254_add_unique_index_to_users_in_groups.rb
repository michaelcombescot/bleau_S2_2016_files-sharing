class AddUniqueIndexToUsersInGroups < ActiveRecord::Migration[5.0]
  def change
    add_index :users_in_groups, [:user_id, :group_id], unique: true
  end
end
