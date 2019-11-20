class User::QuestionsController < ApplicationController

	def index
		@questions = Question.page(params[:page]).per(5)
		@folders = current_user.folders
	end

	def new
		@question = Question.new
	end

	def show
		@question = Question.find(params[:id])
		@comment = Comment.new
		@comments = Comment.all
	end

	def create
		@question = Question.new(question_params)
		@question.user_id = current_user.id
		@question.save
		redirect_to user_questions_path
	end

	def destroy
		@question = Question.find(params[:id])
		@question.delete
		redirect_to user_questions_path
	end

private
	def question_params
		params.require(:question).permit(:question_title, :question_body)
	end

end
