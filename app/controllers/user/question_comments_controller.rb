class User::QuestionCommentsController < ApplicationController

	def create
		@question = Question.find(params[:question_id])
		@question_comment = @question.user.comments.new(question_comment_params)
		@question_comment.question_id = @question.id
		@question_comment.save
		redirect_to user_question_path(@question.id)
	end



private
	def question_comment_params
		params.require(:comment).permit(:comment_body)
	end
end
