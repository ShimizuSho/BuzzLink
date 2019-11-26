class User::FolderContentsController < ApplicationController
	before_action :authenticate_user!

	def index
		@folder = Folder.find(params[:folder_id])
		@folder_contents = @folder.folder_contents.page(params[:page]).per(5)
		@folders = current_user.folders
	end

	def new
		@post = Post.find(params[:post_id])
		@folder_content = FolderContent.new
	end

	def create
		@post = Post.find(params[:post_id])
		@folder_content = FolderContent.new(folder_contents_params)
		@folder_content.post_id = @post.id
		@post.post_title = @folder_content.folder_contents_title
		@folder_content.save
		redirect_to user_post_path(@post.id)
	end

	def update
		@a = folder_contents_params
		@a = @a[:folder_id].to_i
		@folder = Folder.find(@a)
		@folder_content = FolderContent.find(params[:id])
		@folder_content.folder_id = @folder.id
		@folder_content.save
		@folder_contents = @folder.folder_contents.page(params[:page]).per(5)
		@folders = current_user.folders
		render 'user/folder_contents/index'
	end

	def destroy
		@folder_content = FolderContent.find(params[:id])
		@folder_content.destroy
		@folder = Folder.find(params[:folder_id])
		@folder_contents = @folder.folder_contents.page(params[:page]).per(5)
		@folders = current_user.folders
		render 'user/folder_contents/index'
	end

private
	def folder_contents_params
		params.require(:folder_content).permit(:folder_id, :folder_contents_title)
	end


end
