class CreateDegreeManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :degree_managements do |t|
      t.integer :user_id
      t.integer :degree_id

      t.timestamps
    end
  end
end
