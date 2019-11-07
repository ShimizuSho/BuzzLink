class User::QuestionsController < ApplicationController

	def index
		@questions = Question.all
	end

	def new
		@question = Question.new
	end

	def show
		@question = Question.find
		@comment = Comment.new
		@comments = Comment.all
	end

	def create
		@question = Question.new(question_params)
		@question.save
		redirect_to user_questions
	end

private
	def question_params
		params.require(:question).permit(:question_title, :question_body)
	end

end
