class FolderContent < ApplicationRecord

	belongs_to :post
	belongs_to :folder
	validates :folder_id, uniqueness: { scope: [:post_id] }
end
