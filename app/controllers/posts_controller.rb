require 'opengraph_parser'

class PostsController < ApplicationController
  # before_filter :authenticate_user!
  before_action :authenticate_user!, except: [ :show, :autocomplete ]
  skip_before_action :verify_authenticity_token, :only => :create
  before_action :correct_user,   only: :destroy
  prepend_before_action :verify_authenticity_token, only: [:destroy]
  before_action :require_permission, only: [:destroy, :update, :edit]

  def autocomplete
    render json: Post.search(params[:query], autocomplete: false, limit: 10).map do |post|
      { title: post.url, value: 'post-' + post.id }
    end
  end

  # def index
  #   @posts = Post.where(user_id: current_user.id).paginate(:page => params[:page]).order(created_at: :desc)
  # end

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
    og = OpenGraph.new(@post.url)
    @post.og_title = og.title # og.title # => "Open Graph protocol"
    @post.og_type = og.type # og.type # => "website"
    @post.og_description = og.description # og.description # => ""
    @post.og_images = og.images[0] # og.images # => ["http://ogp.me/logo.png"]
    @post.user_id = current_user.id #or whatever is you session name
    if @post.save
      flash[:success] = 'La publication a bien été publiée'
      redirect_to show_profile_path
    else
      @hierarchy = Category.where(public: true, parent_id: nil)
      flash[:error] = 'Une erreur est survenue'
      redirect_to request.referrer || root_url
    end
  end

  def update
    @post = Post.find(params[:id])
    og = OpenGraph.new(@post.url)
    @post.og_title = og.title # og.title # => "Open Graph protocol"
    @post.og_type = og.type # og.type # => "website"
    @post.og_description = og.description # og.description # => ""
    @post.og_images = og.images[0] # og.images # => ["http://ogp.me/logo.png"]
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Post deleted"
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

    def require_permission
      if current_user.id != Post.find(params[:id]).user_id
        redirect_to main_path
      end
    end
end
