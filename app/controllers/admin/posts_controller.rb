class Admin::PostsController < ApplicationController

def index
		@posts = Post.search(params[:search])
		@folders = current_user.folders
	end

	def show
		@post = Post.find(params[:id])
		@post_comment = Comment.new
		@post_comments = Comment.all
		@folders = current_user.folders
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to user_root_path
	end

	private
	def post_params
		params.require(:post).permit(:post_title, :link, :post_body)
	end

end


