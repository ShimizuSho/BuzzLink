class CreateFolderContents < ActiveRecord::Migration[5.2]
  def change
    create_table :folder_contents do |t|
      t.integer :post_id
      t.integer :folder_id
      t.string :folder_contents_title
      t.text :memo
      t.timestamps
    end
  end
end
