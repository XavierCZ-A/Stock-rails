require "csv"

class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_sizes, only: %i[ new create edit update ]
  layout 'product'
  # GET /products or /products.json
  def index
    @pagy, @products = pagy(Product.includes(:category, :product_stock).for_user(Current.user).order_by_date)
    @button = "focus:outline-none text-white bg-purple-700 hover:bg-purple-800 focus:ring-4 focus:ring-purple-300 font-medium rounded-lg text-sm px-5 py-2.5 mb-2 dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-900"
    respond_to do |format|
      format.html
      format.csv { send_data Product.to_csv, filename: "products-#{DateTime.now.strftime("%d%m%Y%H%M")}.csv" }
    end

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
      flash[:notice] = "Product was successfully created."
      # redirect_to products_path, notice: "Product was successfullyk created."
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

  def upload
    uploaded_file = params[:csv_file]
    if uploaded_file.present?
      begin
        csv_data = CSV.parse(uploaded_file.read, headers: true)
        csv_data.each do |row|
          # Process each row of the CSV file
          Product.create!(name: row["name"], description: row["description"], price: row["price"], category_id: row["category_id"], created_at: row["created_at"], updated_at: row["updated_at"])
          redirect_to products_path, notice: "Productos importados correctamente"
          return
        end
      rescue  CSV::MalformedCSVError
        redirect_to products_path, alert: "El archivo no tiene el formato correcto"
      end
    else
      redirect_to products_path, alert: "Debes subir un archivo CSV"
    end
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
