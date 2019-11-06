class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.integer :post_id
      t.string :memo_body

      t.timestamps
    end
  end
end
