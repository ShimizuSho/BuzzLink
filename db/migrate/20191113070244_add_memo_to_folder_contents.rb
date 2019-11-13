class AddMemoToFolderContents < ActiveRecord::Migration[5.2]
  def change
    add_column :folder_contents, :memo, :text
  end
end
