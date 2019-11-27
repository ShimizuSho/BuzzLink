class Admin::CommentsController < ApplicationController

	def destroy
		@post_comment = Comment.find(params[:id])
		@post = Post.find(@post_comment.post_id)
		@post_comment.destroy

		redirect_to admin_post_path(@post.id)
	end
end
