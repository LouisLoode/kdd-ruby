class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def autocomplete
    data = Category.search(params[:query], autocomplete: false, limit: 10)
    render json: data.map do |category|
      { title: category.name, value: category.id }
    end
  end

  def index
    @hierarchy = Category.where(public: true, parent_id: nil)
    @categories = if params[:query].present?
        Category.search(params[:query])
      else
        Category.where(public: true)
      end
  end

  def show
    @hierarchy = Category.where(public: true, parent_id: nil)
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  def get_all_oses
    @hierarchy = Category.where(public: true)
  end

  private
    def category_params
      params.require(:category).permit(:name, :description, :public, :parent_id)
    end

end
