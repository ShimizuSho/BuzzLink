class FolderContent < ApplicationRecord

	belongs_to :post
	belongs_to :folder
	validates :folder_id, uniqueness: { scope: [:post_id] }
	validates :folder_contents_title, presence: true, length: { maximum: 50 }
end
