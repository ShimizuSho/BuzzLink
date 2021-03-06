class User::FoldersController < ApplicationController
	before_action :authenticate_user!

	def	index
		@folders = current_user.folders
	end

	def new
		20.times do |i|
			i += 1
			@folder = Folder.new
			@folder.user_id = current_user.id
			@folder.folder_name = "folder#{i}"
			@folder.save
			#<!-- ユーザー毎にフォルダーを20作成 -->
	  	end
	  	@degree_management = DegreeManagement.new
		@degree_management.user_id = current_user.id
		@degree_management.degree_id = 1
		@degree_management.save
		@degree_management = DegreeManagement.new
		@degree_management.user_id = current_user.id
		@degree_management.degree_id = 2
		@degree_management.save
	    redirect_to user_posts_path
	end

	def update
		@folder = Folder.find(params[:id])
		@folder.update(folder_params)
		@folders = current_user.folders
		@number = @folders.index(@folder) + 1
	end

	def destroy
		@folder = Folder.find(params[:id])
		@folder_contents = @folder.folder_contents
		@folder_contents.destroy_all
		@folder_contents = @folder.folder_contents.page(params[:page]).per(10).reverse_order
		@folders = current_user.folders
		render 'user/folder_contents/index'

	end

	private
		def folder_params
			params.require(:folder).permit(:folder_name)
		end
end
