class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).order('id DESC')

  end

  def new
    @post = Post.new
  end

  def create
    Post.create(create_params)
    redirect_to controller: :posts, action: :index
  end

  def destroy
    post = Post.find(params[:id])
      post.destroy if post.user_id == current_user.id
      redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  post = Post.find(params[:id])
  if post.user_id == current_user.id
    post.update(create_params)
  end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
  end

  private
  def create_params
    params.require(:post).permit(:movie_url, :description).merge(user_id: current_user.id)
  end

end
