class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
  	@posts = Post.all
  	@post = Post.new
  end

  def show
  	@post = Post.find(params[:id])
  	@post_new = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: "投稿に成功しました"
    else
      @posts = Post.all
      render 'index'
    end
  end

  def edit
  end

  def update
  	if @post.update(post_params)
  	  redirect_to post_path(@post), notice:"更新に成功しました"
  	else
  	  render "edit"
  	end
  end

  def destroy
  	@post.destroy
  	redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      flash[:notice] = "権限がありません"
      redirect_to posts_path
    end
  end
end
