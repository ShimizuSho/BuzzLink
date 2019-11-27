class User::QuestionCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@question = Question.find(params[:question_id])
		@question_comment = @question.user.question_comments.new(question_comment_params)
		@question_comment.question_id = @question.id
		@question_comment.save
		redirect_to user_question_path(@question.id)
	end

	def destroy

		@question_comment = QuestionComment.find(params[:id])
		@question_comment.destroy
		redirect_to user_questions_path
	end



private
	def question_comment_params
		params.require(:question_comment).permit(:comment_body)
	end
end
