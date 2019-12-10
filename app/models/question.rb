class Question < ApplicationRecord

	has_many :question_comments, dependent: :destroy
	belongs_to :user
	validates :question_title, presence: true, length: { maximum: 50 }
	validates :question_body, presence: true, length: { maximum: 1000 }
end
