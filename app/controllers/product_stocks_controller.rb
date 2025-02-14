class ProductStocksController < ApplicationController
  before_action :set_product_stock, only: %i[ show edit update destroy ]
  layout "product"
  # GET /product_stocks or /product_stocks.json
  def index
    @product_stocks = ProductStock.all
  end

  # GET /product_stocks/1 or /product_stocks/1.json
  def show
  end

  # GET /product_stocks/new
  def new
    @product_stock = ProductStock.new
  end

  # GET /product_stocks/1/edit
  def edit
  end

  # POST /product_stocks or /product_stocks.json
  def create
    @product_stock = ProductStock.new(product_stock_params)
    if @product_stock.save
      redirect_to product_stocks_path, notice: "Product stock was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /product_stocks/1 or /product_stocks/1.json
  def update
    if @product_stock.update(product_stock_params)
      redirect_to @product_stock, notice: "Product stock was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /product_stocks/1 or /product_stocks/1.json
  def destroy
    @product_stock.destroy!
    redirect_to product_stocks_path, status: :see_other, notice: "Product stock was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product_stock
    @product_stock = ProductStock.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def product_stock_params
    params.expect(product_stock: [:quantity, :product_id, :notification_stock, :min_stock, :warehouse_id])
  end
end
