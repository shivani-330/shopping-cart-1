class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!

  def index
    # @products = Product.all
    @products = Product.paginate(page: params[:page], per_page: 2).order('created_at DESC')
  end

  def search
    if params[:search].blank?
      redirect_to(products_path, alert: "Empty field!") and return
    else
      keyword = params[:search]
      @products = Product.where("title LIKE ?", "%#{keyword}%")
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product  
    else
      render 'new'
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:title, :description, :price, images: [])
    end

    def set_product
      @product = Product.find(params[:id])
    end

end
