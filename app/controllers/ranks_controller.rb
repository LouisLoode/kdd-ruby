class RanksController < ApplicationController
  before_filter :authenticate_user!

  def create
    @rank = Rank.new(:note => params[:note], :user_id => params[:user_id], :post_id => params[:post_id])
    @rank.save
  end

end
