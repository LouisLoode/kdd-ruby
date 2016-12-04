class RanksController < ApplicationController
  before_filter :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @rank = @post.rank.create(rank_params)
    redirect_to post_path(@post)
  end

  private
    def rank_params
      params.require(:rank).permit(:note)
    end
end
