class Admin::QuestionsController < ApplicationController

	def index
		@questions = Question.page(params[:page]).per(50).reverse_order
	end

	def show
		@question = Question.find(params[:id])
		@comment = Comment.new
		@comments = @question.comments
	end

	def destroy
		@question = Question.find(params[:id])
		@question.delete
		redirect_to admin_questions_path
	end
end