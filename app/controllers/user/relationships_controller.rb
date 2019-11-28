class User::RelationshipsController < ApplicationController
    before_action :authenticate_user!

    def create
        @user = User.find(params[:user_id])
        follow = current_user.active_relationships.build(follower_id: params[:user_id])
        follow.save
        redirect_back(fallback_location: user_root_path)
    end

    def destroy
        @user = User.find(params[:user_id])
        follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
        follow.destroy
        redirect_back(fallback_location: user_root_path)
    end
end

