class User::UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@degrees = Degree.all.limit((@user.evolution * 2) + 2)
		degree_management = @user.degree_management
		@folders = current_user.folders
		@favorite_posts = @user.favorite_posts
		@user_level = (@user.point / 100).to_i

		@currentUserEntry=Entry.where(user_id: current_user.id)
    	@userEntry=Entry.where(user_id: @user.id)
	    if @user.id != current_user.id
	      	@currentUserEntry.each do |cu|
	        	@userEntry.each do |u|
	          		if cu.room_id == u.room_id then
	            	@isRoom = true
	            	@roomId = cu.room_id
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

	def edit
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		degree_management = @user.degree_management
		degree_management.degree_id = params[:user][:id]
		degree_management.save
		redirect_to user_user_path(@user.id)
	end

	def follows
    	@user = User.find(params[:id])
    	@users = @user.followings.page(params[:page]).per(10)
    	@folders = current_user.folders
  	end

  	def followers
    	@user = User.find(params[:id])
    	@users = @user.followers.page(params[:page]).per(10)
    	p @users
    	@folders = current_user.folders
  	end

  	def evolution
    	@user = User.find(params[:user_id])
  		new_evolution = @user.point/1000
  		@user.update(evolution: new_evolution)
  	end


private
	def user_params
		params.require(:user).permit(:profile_image, :age, :gender, :birthday, :introduction)
	end

end


