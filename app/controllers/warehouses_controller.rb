class WarehousesController < ApplicationController
  before_action :set_warehouse, only: %i[ show edit update destroy ]
  layout "product"

  # GET /warehouses or /warehouses.json
  def index
    @warehouses = Warehouse.includes(:product_stocks).all
    # Obtener el stock total de cada warehouse
    @stock_by_warehouse = @warehouses.each_with_object({}) do |warehouse, hash|
      hash[warehouse.id] = warehouse.product_stocks.sum(:quantity) || 0
    end

    @capacity = 5000

  end

  # GET /warehouses/1 or /warehouses/1.json
  def show
  end

  # GET /warehouses/new
  def new
    @warehouse = Warehouse.new
  end

  # GET /warehouses/1/edit
  def edit
  end

  # POST /warehouses or /warehouses.json
  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      redirect_to @warehouse, notice: "Warehouse was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /warehouses/1 or /warehouses/1.json
  def update
    if @warehouse.update(warehouse_params)
      redirect_to @warehouse, notice: "Warehouse was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /warehouses/1 or /warehouses/1.json
  def destroy
    @warehouse.destroy!
    redirect_to warehouses_path, status: :see_other, notice: "Warehouse was successfully destroyed."
    head :no_content

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_warehouse
    @warehouse = Warehouse.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def warehouse_params
    params.expect(warehouse: [:name, :location])
  end
end
