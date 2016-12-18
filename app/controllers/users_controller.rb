  class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy,
                                      :following, :followers]

  def autocomplete
    render json: User.search(params[:query], autocomplete: false, limit: 10).map do |user|
      { title: user.name, value: 'user-' + user.id }
    end
  end

  def show
     if params[:id] === 'list'
       @users = User.all
       render 'list'
     elsif params[:id]
       @user = User.find(params[:id])
       @posts = Post.where(:user_id => params[:id]).paginate(:page => params[:page]).order(created_at: :desc)
     elsif !params[:id] && authenticate_user!
       @user = User.find(current_user.id)
       @posts = Post.where(:user_id => current_user.id).paginate(:page => params[:page]).order(created_at: :desc)
     end
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
