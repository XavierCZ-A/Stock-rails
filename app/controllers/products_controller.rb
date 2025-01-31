class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_sizes, only: %i[ new create edit update ]
  layout 'product'


  # GET /products or /products.json
  def index
    @pagy, @products = pagy(Product.all)

    if params[:query_text].present?
      @products = Product.search_full_text(params[:query_text])
    end
    if params[:category_id].present?
      @products = Product.where(category_id: params[:category_id])
    end
    if params[:stock_min].present?
      @products = Product.joins(:product_stock).where("product_stocks.quantity >= ?", params[:stock_min])
    end
    if params[:price_min].present?
      @products = Product.where("price >= ?", params[:price_min])
    end
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!
    redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params.expect(:id))
  end

  def set_sizes
    @sizes = Size.all
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.expect(product: [:name, :description, :price, :category_id, size_ids: []])
  end
end
