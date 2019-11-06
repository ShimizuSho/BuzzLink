class Post < ApplicationRecord

	has_many :comments
	has_many :memos
	belongs_to :user
	belongs_to :folder, optional: true

end
