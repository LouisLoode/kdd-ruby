class RatesController < ApplicationController
  before_filter :authenticate_user!

  # def create
  #   @rank = Rank.new(:note => params[:note], :user_id => params[:user_id], :post_id => params[:post_id])
  #   @rank.save
  # end

  def create
    # if !current_user.already_likes?(@post)
    @rate = Rate.find_by(:user_id => current_user.id, :post_id => params[:post_id])
    if @rate
      @rate.destroy
      @rate = Rate.new(:user_id => current_user.id, :post_id => params[:post_id], :score => params[:score])
    else
      @rate = Rate.new(:user_id => current_user.id, :post_id => params[:post_id], :score => params[:score])
    end
    @rate.save
    respond_to do |format|
      format.html { redirect_to @rate }
      format.js
    end
      # just for some log in console
    # end
  end

  def update
    @rate = Rate.find(params[:id])
    @post.update(post_params)
      puts "finish !!!!!"
  end

end
