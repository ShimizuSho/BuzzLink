class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :question_title
      t.string :question_body

      t.timestamps
    end
  end
end
