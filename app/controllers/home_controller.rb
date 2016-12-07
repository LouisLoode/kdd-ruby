class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to main_path
    else
      # render :layout => false
      render layout: "home_layout"
    end
  end

  def main
    if !user_signed_in?
      redirect_to root_path
    end
    #@TODO need to get followed posts
    @posts = Post.all.sort_by(&:created_at).reverse!
  end

end
