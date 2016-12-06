class UsersController < ApplicationController
  before_action :authenticate_user!
  helper_method :how_much_time

  def show
    # id_user = params[:id] === nil ? current_user.id : params[:id]
    @user = User.find(params[:user_id])
    @posts = Post.where('user_id' => params[:user_id]).sort_by(&:created_at).reverse!
  end

  def list
  	@users = User.all
  end

  def how_much_time(params)
    now = Time.new
    diff = (now - params).to_i
    if diff < 60
    	return diff.to_s + " s"
    elsif diff < (60*60)
    	return (diff/60).to_s + " m"
    elsif diff < (60*60*24)
    	return (diff/(60*60)).to_s + " h"
    elsif diff < (60*60*24*30)
    	return (diff/(60*60*24)).to_s + " d"
    elsif diff < (60*60*24*365)
    	return (diff/(60*60*24*30)).to_s + " M"
    elsif diff >= (60*60*24*365)
    	return (diff/(60*60*24*30*365)).to_s + " Y"
    end	
  end  


end
