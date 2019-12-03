class Admin::QuestionsController < ApplicationController

	def index
		@questions = Question.page(params[:page]).per(50).reverse_order
	end

	def show
		@question = Question.find(params[:id])
		@comment = Comment.new
		@question_comments = @question.question_comments.reverse_order
	end

	def destroy
		@question = Question.find(params[:id])
		@question.delete
		redirect_to admin_questions_path
	end
end