class RenameDgreeNameColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :degrees, :dgree_name, :degree_name
  end
end
