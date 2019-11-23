class Question < ApplicationRecord

	has_many :question_comments, dependent: :destroy
	belongs_to :user
end
