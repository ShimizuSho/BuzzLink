class ChangeColumnForUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :users, :gender, "未設定"
  	change_column_default :users, :degree, "未設定"
  	change_column :users, :introduction, :text, arrey: true, default: "未設定"
  end
end
