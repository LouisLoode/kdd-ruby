class RatesController < ApplicationController
  before_action :authenticate_user!

  def create
    @rate = Rate.find_by(:user_id => current_user.id, :post_id => params[:post_id])
    if @rate
      @rate.destroy
      @rate = Rate.new(:user_id => current_user.id, :post_id => params[:post_id], :score => params[:score])
    else
      @rate = Rate.new(:user_id => current_user.id, :post_id => params[:post_id], :score => params[:score])
    end
    if @rate.save
      user_owned = User.find(Post.find(params[:post_id]).user_id)
      user_owned.update_pertinence
      respond_to do |format|
        format.html { redirect_to @rate }
        format.js
      end
    end
  end

end
