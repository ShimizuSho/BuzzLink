class User::CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@post_comment = current_user.comments.new(post_comment_params)
		@post_comment.post_id = @post.id
		@post_comment.save
		@post_comment = Comment.new
		@post_comments = Comment.all
		@folders = current_user.folders
		@folder_content = FolderContent.new
		render 'user/posts/show'
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

