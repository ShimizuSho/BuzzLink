class Folder < ApplicationRecord

	belongs_to :user
	has_many :posts, dependent: :destroy
	has_many :folder_contents, dependent: :destroy
end
