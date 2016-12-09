class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favorite = Favorite.new(:user_id => current_user.id, :post_id => params[:post_id])
    if @favorite.save
      respond_to do |format|
        format.html { redirect_to @favorite }
        format.js
      end
    end
  end

  def delete
    @favorite = Favorite.find_by(:user_id => current_user.id, :post_id => params[:post_id])
    if @favorite.delete
      respond_to do |format|
        format.html { redirect_to @favorite }
        format.js
      end
    end
  end




end
