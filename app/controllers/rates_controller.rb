class RatesController < ApplicationController
  before_filter :authenticate_user!

  # def create
  #   @rank = Rank.new(:note => params[:note], :user_id => params[:user_id], :post_id => params[:post_id])
  #   @rank.save
  # end

  def create
    # if !current_user.already_likes?(@post)
      @rate = Rate.new(:note => params[:note], :user_id => current_user.id, :post_id => params[:post_id])

      @rate.save if !Rate.where(user_id: current_user.id, post_id: params[:post_id])
      # just for some log in console
      puts "Rate created and succesfull send to db"
    # end
  end

  def update
    @rate = Rate.find(params[:id])
    @post = @rate.post
    if @rate.update_attributes(score: params[:score])
      respond_to do |format|
        format.js
      end
    end
  end


  # private
  #   def ranks_params
  #     params.require(:rank).permit(:note, :user_id, :post_id, :pant_id)
  #   end

end
