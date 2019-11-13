class RenameTitreColumnToFolderContents < ActiveRecord::Migration[5.2]
  def change
  	rename_column :folder_contents, :folder_contents, :folder_contents_title
  end
end
