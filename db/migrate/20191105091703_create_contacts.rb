class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :name
      t.string :status
      t.text :contact_body

      t.timestamps
    end
  end
end
