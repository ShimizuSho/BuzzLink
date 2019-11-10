class Question < ApplicationRecord

	has_many :comments
	has_many :question_comments
	belongs_to :user

end
