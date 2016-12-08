class RatesController < ApplicationController
  before_filter :authenticate_user!

  # def create
  #   @rank = Rank.new(:note => params[:note], :user_id => params[:user_id], :post_id => params[:post_id])
  #   @rank.save
  # end

  def create
    # if !current_user.already_likes?(@post)
      @rate = Rate.new(:note => params[:note], :user_id => current_user.id, :post_id => params[:post_id])

<<<<<<< HEAD
<<<<<<< HEAD
      @rate.save

      puts "Envois la moula"
=======
      @rate.save 
=======
      @rate.save if !Rate.where(user_id: current_user.id, post_id: params[:post_id])
>>>>>>> b50347b2cfe5e498900665770694ea91ac1f952f
      # just for some log in console
      puts "Rate created and succesfull send to db"
>>>>>>> 67fc850ae00addf10de778a69fe2fc239eb2d4f6
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
