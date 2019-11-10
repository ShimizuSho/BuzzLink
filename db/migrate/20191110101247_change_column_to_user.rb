class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :user, :age, default: "未設定"
  	change_column_default :user, :gender, default: "未設定"
  	change_column_default :user, :birthday, default: "未設定"
  	change_column_default :user, :degree, default: "未設定"
  	change_column_default :user, :introduction, default: "未設定"
  end
end
