class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    # id_user = params[:id] === nil ? current_user.id : params[:id]
    @user = User.find(params[:user_id])
    @posts = Post.where('user_id' => params[:user_id]).sort_by(&:created_at).reverse!
  end

  def list
  	@users = User.all
  end
  
end
