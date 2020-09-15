class FavoritesController < ApplicationController

  def create
  	post = Post.find(params[:post_id])
  	favorite = current_user.favorites.new(post_id: post.id)
  	favorite.save
  	redirect_to request.referer
  	# 遷移元urlを取得
  end

  def destroy
  	post = Post.find(params[:post_id])
  	favorite = current_user.favorites.find_by(post_id: post.id, user_id: current_user.id)
  	favorite.destroy
  	redirect_to request.referer
  end
end
