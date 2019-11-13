class RemoveFolderContentsTitleFromFolderContents < ActiveRecord::Migration[5.2]
  def change
    remove_column :folder_contents, :folder_contents_title, :string
  end
end
