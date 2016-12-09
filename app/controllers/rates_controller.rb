class RatesController < ApplicationController
  before_filter :authenticate_user!

  def create
    # if !current_user.already_likes?(@post)
    @rate = Rate.find_by(:user_id => current_user.id, :post_id => params[:post_id])
    if @rate
      @rate.destroy
      @rate = Rate.new(:user_id => current_user.id, :post_id => params[:post_id], :score => params[:score])
    else
      @rate = Rate.new(:user_id => current_user.id, :post_id => params[:post_id], :score => params[:score])
    end
    if @rate.save
      respond_to do |format|
        format.html { redirect_to @rate }
        format.js
      end
    end  
  end

end
