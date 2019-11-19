class User::FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.build(post_id: params[:post_id]) # buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
    favorite.save
    current_user.point += 1
    current_user.update
    @post = Post.find(params[:post_id])
    new_point = @post.user.point + 5
    @post.user.update(point: new_point)
    redirect_to user_post_path(favorite.post.id)
  end

  def destroy
    favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    favorite.destroy
    redirect_to user_post_path(favorite.post.id)
  end

end
