class Admin::QuestionCommentsController < ApplicationController

	def destroy
		@question_comment = QuestionComment.find(params[:id])
		@question_comment.destroy
		redirect_back(fallback_location: root_path)
	end
end
