class ChangePostBodyToPosts < ActiveRecord::Migration[5.2]
  def change
  	change_column :posts, :post_body, :text
  end
end
