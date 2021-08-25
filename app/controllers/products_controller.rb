class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.order("created_at DESC")
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
      redirect_to products_path()
    else
    end
  end

  def update
    if @product.update(product_params)
      redirect_to products_path()
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy

    redirect_to request.referrer
  end

  private

  def product_params
    params.require(:product).permit(
      :title,
      :description,
    )
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
