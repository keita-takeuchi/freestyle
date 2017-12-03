class UsersController < ApplicationController
  include UsersHelper
   before_action only: [:index, :edit, :update, :destroy, :following, :followers]

   def index
    @users = User.all
    gon.markerData = []
    @users.each do |user|
      lat = user.latitude
      lng = user.longitude
      name = user.nickname
      gon.markerData << { name: name, lat: lat, lng: lng }
    end
   end

  def show
    @nickname = current_user.nickname
    @posts = current_user.posts  #このコード不安
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    # binding.pry
    @user = current_user
    @user.update(user_params)
    redirect_to @user
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

  private
  def user_params
    params.require(:user).permit(:nickname, :description, :image_url, :address)
  end
end
