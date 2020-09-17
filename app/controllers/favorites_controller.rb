class FavoritesController < ApplicationController

  def create
  	@post = Post.find(params[:post_id])
  	favorite = current_user.favorites.new(post_id: @post.id, user_id: current_user.id)
  	favorite.save

  	# 遷移元urlを取得
  end

  def destroy
  	@post = Post.find(params[:post_id])
  	favorite = current_user.favorites.find_by(post_id: @post.id, user_id: current_user.id)
  	favorite.destroy

  end
end
