class User::PostsController < ApplicationController

	def index
		@posts = Post.search(params[:search])
		@folders = current_user.folders
	end

	def new
		@post = Post.new
	end

	def create
		post = Post.new(post_params)
		post.user_id = current_user.id
		post.save
		new_point = post.user.point + 10
		@post.user.update(point: new_point)
		redirect_to user_root_path
	end

	def show
		@post = Post.find(params[:id])
		@post_comment = Comment.new
		@post_comments = Comment.all
		@folders = current_user.folders
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to user_post_path(@post.id)
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




