class UsersController < ApplicationController
  before_action :authenticate_user!

  def show_by_id
    @user = User.find(params[:id])
    @posts = Post.where('user_id' => params[:id])
  end


end
