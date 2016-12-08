  class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy,
                                      :following, :followers]

  def autocomplete
    render json: User.search(params[:query], autocomplete: false, limit: 10).map do |user|
      { title: user.name, value: user.id }
    end
  end

  def show
    params[:id] == nil ? id_user == current_user.id : id_user == params[:id]
    # if id_user.to_i.to_s
      @user = User.find(id_user)
      @posts = Post.where('user_id' => id_user).sort_by(&:created_at).reverse!
    # else
      # redirect_to root_path
    # end
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
