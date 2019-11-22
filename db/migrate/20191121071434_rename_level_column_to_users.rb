class RenameLevelColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :level, :evolution
  end
end
