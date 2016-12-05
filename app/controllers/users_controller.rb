class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    id_user = params[:id] === nil ? current_user.id : params[:id]

    @user = User.find(id_user)
    @posts = Post.where('user_id' => id_user)
  end

end
