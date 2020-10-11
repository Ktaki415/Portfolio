class PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
  @post = Post.find(params[:post_id])
	@post_comment = PostComment.new(comment_params)
	@post_comment.user_id = current_user.id
	@post_comment.post_id = @post.id
  	if @post_comment.save
  	  flash[:success] = "コメントを投稿しました"
  	  redirect_to request.referer
  	else
  	  redirect_to request.referer
  	end
  end

  def destroy
  	@post = Post.find(params[:post_id])
    post_comment = current_user.post_comments.find_by(id: params[:id], post_id: @post.id)
    post_comment.destroy
    redirect_to request.referer
  end

  private
  def comment_params
  	params.require(:post_comment).permit(:comment, :profile_image)
  end

end
