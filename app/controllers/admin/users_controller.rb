class Admin::UsersController < ApplicationController

	def index
		@user = User.all
	end

	def show
		@user = User.find(params[:id])
		@favorite_posts = @user.favorite_posts

		@currentAdminEntry=Entry.where(user_id: current_admin.id)
    	@userEntry=Entry.where(user_id: @user.id)
	    if @user.id != current_admin.id
	      	@currentAdminEntry.each do |au|
	        	@userEntry.each do |u|
	          		if au.room_id == u.room_id then
	            	@isRoom = true
	            	@roomId = au.room_id
	            	end
	        	end
	        end
	    end
	    if @isRoom
	    else
	      	@room = Room.new
	      	@entry = Entry.new
	    end
	end
end
