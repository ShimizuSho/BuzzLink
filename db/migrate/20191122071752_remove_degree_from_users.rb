class RemoveDegreeFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :degree, :string
  end
end
