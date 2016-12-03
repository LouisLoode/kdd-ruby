class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to main_path
    else
    render :layout => "application"
    end
  end

  def main
    if !user_signed_in?
      @user = user
      redirect_to root_path
    end
  end

end
