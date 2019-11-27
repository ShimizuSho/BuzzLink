class RemoveUserIdFromContactss < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :user_id, :integer
  end
end
