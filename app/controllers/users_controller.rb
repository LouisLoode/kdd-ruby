class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:user_id])
    @posts = Post.where('user_id' => params[:user_id])
  end	

  def list
  	@users = User.all
  end
  
end
