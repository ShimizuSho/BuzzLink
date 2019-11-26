class QuestionComment < ApplicationRecord

	belongs_to :question
	belongs_to :user
	validates :comment_body, presence: true, length: { maximum: 300 }
end
