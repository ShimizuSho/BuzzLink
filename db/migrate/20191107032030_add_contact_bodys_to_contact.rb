class AddContactBodysToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :contact_body, :text
  end
end
