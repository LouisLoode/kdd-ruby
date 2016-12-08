  class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy,
                                      :following, :followers]

  def autocomplete
    render json: User.search(params[:query], autocomplete: false, limit: 10).map do |user|
      { title: user.name, value: 'user-' + user.id }
    end
  end

  def list
  	@users = User.all
  end

  def show
     if params[:id] && !current_user
       @user = User.find(params[:id])
       @posts = Post.where('user_id' => params[:id]).sort_by(&:created_at).reverse!
     elsif !params[:id] && current_user
       @user = User.find(current_user.id)
       @posts = Post.where('user_id' => current_user.id).sort_by(&:created_at).reverse!
     else
       redirect_to root_path
     end
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
