class PostsController < ApplicationController
  # before_filter :authenticate_user!
  before_action :authenticate_user!, except: [ :show ]
  skip_before_action :verify_authenticity_token, :only => :create
    before_action :correct_user,   only: :destroy
  prepend_before_action :verify_authenticity_token, only: [:destroy]

  def index
    @posts = Post.where(user_id: current_user.id)
    # @hierarchy = Category.where(public: true, parent_id: nil)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @hierarchy = Category.where(public: true, parent_id: nil)
    @post = Post.new
  end

  def edit
    @hierarchy = Category.where(public: true, parent_id: nil)
    @post = Post.find(params[:id])
  end


  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id #or whatever is you session name
    if @post.save
      redirect_to @post
    else
      @hierarchy = Category.where(public: true, parent_id: nil)
      render :new
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
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private
    def post_params
      params.require(:post).permit(:url, :message, category_ids: [])
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
