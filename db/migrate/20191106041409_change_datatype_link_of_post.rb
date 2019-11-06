class ChangeDatatypeLinkOfPost < ActiveRecord::Migration[5.2]
  def change
  	change_column :posts, :link, :text
  end
end
