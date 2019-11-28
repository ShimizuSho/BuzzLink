class Admin::PostsController < ApplicationController

	def index
		@posts = Post.search(params[:search]).page(params[:page]).per(30).reverse_order
	end

	def show
		@post = Post.find(params[:id])
		@post_comment = Comment.new
		@post_comments = @post.comments.page(params[:page]).per(50).reverse_order
	end

	def update
		@post = User.find(params[:id])
		@post.update(post_params)
		redirect_to user_user_path(@user.id)
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to admin_posts_path
	end

	private
	def post_params
		params.require(:post).permit(:post_title, :link, :post_body)
	end

end


