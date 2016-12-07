class RanksController < ApplicationController
  before_filter :authenticate_user!

  def create
    @rank = Rank.new(:note => params[:note], :user_id => params[:user_id], :post_id => params[:post_id])
    @rank.save
  end

  # private
  #   def ranks_params
  #     params.require(:rank).permit(:note, :user_id, :post_id, :pant_id)
  #   end

end
