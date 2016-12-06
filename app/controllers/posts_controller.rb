class PostsController < ApplicationController
  before_filter :authenticate_user!
  # before_filer :authenticate_user!, except: [ :index, :show ]
  skip_before_filter :verify_authenticity_token, :only => :create
  prepend_before_filter :verify_authenticity_token, only: [:destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end


  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id #or whatever is you session name
    # @post.cat_id
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:url, :message, :cat_id)
    end
end
