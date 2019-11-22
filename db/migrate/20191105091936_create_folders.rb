class CreateFolders < ActiveRecord::Migration[5.2]
  def change
    create_table :folders do |t|
      t.integer :user_id
      t.string :folder_name
      t.integer :folder_id

      t.timestamps
    end
  end
end
