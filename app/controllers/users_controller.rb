  class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy,
                                      :following, :followers]

  def show
    id_user = params[:id] === nil ? current_user.id : params[:id]
    @user = User.find(id_user)
    @posts = Post.where('user_id' => params[:user_id]).sort_by(&:created_at).reverse!
  end

  def list
  	@users = User.all
  end

  def test
  	current_user.name = params[:name]
  	current_user.update
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
