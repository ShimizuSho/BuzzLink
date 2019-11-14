class Post < ApplicationRecord

	has_many :comments, dependent: :destroy
	has_many :folder_contents
	belongs_to :user
	belongs_to :folder, optional: true

end
