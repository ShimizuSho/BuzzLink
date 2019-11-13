class Folder < ApplicationRecord

	belongs_to :user
	has_many :posts
	has_many :folder_contents

end
