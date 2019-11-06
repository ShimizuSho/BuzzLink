class User::FoldersController < ApplicationController

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


end
