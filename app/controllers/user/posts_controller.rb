class User::PostsController < ApplicationController
	before_action :authenticate_user!

	def index
		@posts = Post.search(params[:search]).page(params[:page]).per(20).reverse_order
		@folders = current_user.folders
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if  @post.save
			new_point = @post.user.point.to_i + 50
			@post.user.update(point: new_point)
			flash[:notice] = "絆ポイントを50ポイント獲得しました！"
			redirect_to user_posts_path
		else
			render 'user/posts/new'
		end
	end

	def show
		@post = Post.find(params[:id])
		@post_comment = Comment.new
		@post_comments = @post.comments.page(params[:page]).per(20).reverse_order
		@folders = current_user.folders
		@folder_content = FolderContent.new
	end

	def update
		@post = Post.find(params[:id])
		if  @post.update(post_params)
			redirect_to user_post_path(@post.id)
		else
			@post_comment = Comment.new
			@post_comments = @post.comments.page(params[:page]).per(20).reverse_order
			@folders = current_user.folders
			@folder_content = FolderContent.new
			render 'user/posts/show'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to user_posts_path
	end

	private
	def post_params
		params.require(:post).permit(:post_title, :link, :post_body)
	end
end




