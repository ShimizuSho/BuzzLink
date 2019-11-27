class User::QuestionsController < ApplicationController
	before_action :authenticate_user!

	def index
		@questions = Question.page(params[:page]).per(5).reverse_order
		@folders = current_user.folders
	end

	def new
		@question = Question.new
	end

	def show
		@question = Question.find(params[:id])
		@question_comment = QuestionComment.new
		@question_comments = @question.question_comments.reverse_order
		@folders = current_user.folders
	end

	def create
		@question = Question.new(question_params)
			@question.user_id = current_user.id
			if  @question.save
			new_point = @question.user.point.to_i + 10
			@question.user.update(point: new_point)
			flash[:notice] = "絆ポイントを10ポイント獲得しました！"
			redirect_to user_questions_path
		else
			render 'user/questions/new'
		end
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
