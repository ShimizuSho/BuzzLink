class Comment < ApplicationRecord

	belongs_to :user
	belongs_to :post, optional: true
	belongs_to :question, optional: true

	validates :comment_body, presence: true, length: { maximum: 100 }
end
