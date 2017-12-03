class UsersController < ApplicationController
  include UsersHelper
   before_action only: [:index, :edit, :update, :destroy, :following, :followers]

   def index
    @user = User.all
   end

  def show
    @nickname = current_user.nickname
    @posts = current_user.posts  #このコード不安
    @user = User.find(params[:id])
  end

  def search
    params[:search] ||= []
    @user = User.where("nickname LIKE(?)", "%#{params[:search]}%")
  end

    def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
end
