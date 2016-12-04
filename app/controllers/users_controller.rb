class UsersController < ApplicationController
  before_action :authenticate_user!
  
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
end
