class User::FoldersController < ApplicationController

def	index
	@folders = current_user.folders
end

def new
	20.times do |i|
	i += 1
	@folder = Folder.new
	@folder.user_id = current_user.id
	@folder.folder_name = "フォルダー#{i}"
	@folder.save
  	end
    redirect_to user_root_path
end

def update
	@folder = Folder.find(params[:id])
	@folder.update(folder_params)
	@folders = current_user.folders
	@number = @folders.index(@folder) + 1
end

private
	def folder_params
		params.require(:folder).permit(:folder_name)
	end

end
