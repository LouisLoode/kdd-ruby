class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to main_path
    else
      render :layout => true
    end
  end

  def main
    if !user_signed_in?
      redirect_to root_path
    else
      @hierarchy = Category.where(public: true, parent_id: nil)
      @user = @user = User.find(current_user.id)
      @feed_items = current_user.feed.paginate(:page => params[:page]).order(created_at: :desc)
    end
  end

end
