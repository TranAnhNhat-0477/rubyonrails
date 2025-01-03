class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  allow_unauthenticated_access only: %i[ index show ]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
    @brands = Brand.all  # Lấy tất cả các thương hiệu
  end

  def create
    @product = Product.new(product_params)
    @product.price = (@product.price.to_f * 100).round
    if @product.save
      redirect_to @product
    else
      @brands = Brand.all  # Lấy lại danh sách thương hiệu nếu có lỗi
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @brands = Brand.all  # Lấy tất cả các thương hiệu khi chỉnh sửa
  end

  def update
    @product.price = (params[:product][:price].to_f * 100).round if params[:product][:price].present?
    if @product.update(product_params)
      redirect_to @product
    else
      @brands = Brand.all  # Lấy lại danh sách thương hiệu nếu có lỗi
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :short_description, :brand_id, :featured_image, :inventory_count)
    end    
end
