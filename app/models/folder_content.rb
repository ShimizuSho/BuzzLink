class FolderContent < ApplicationRecord

	belongs_to :post
	belongs_to :folder
end
