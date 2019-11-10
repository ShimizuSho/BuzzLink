class User::CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@post_comment = current_user.comments.new(post_comment_params)
		@post_comment.post_id = @post.id
		@post_comment.save
		redirect_to user_post_path(@post.id)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to user_post_path(@post.id)
	end







private
	def post_comment_params
		params.require(:comment).permit(:comment_body)
	end




end

