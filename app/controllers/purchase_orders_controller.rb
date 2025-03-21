class PurchaseOrdersController < ApplicationController
  # before_action :set_step, only: [:new]
  before_action :set_purchase_order, only: %i[ show edit update destroy ]
  layout "product"

  # GET /purchase_orders or /purchase_orders.json
  def index
    @purchase_orders = PurchaseOrder.all
  end

  # GET /purchase_orders/1 or /purchase_orders/1.json
  def show
    @purchase_order = PurchaseOrder.includes(order_items: :product).find(params[:id])
    pp "Purchase order: #{@purchase_order.order_items.inspect}"
    @current_step = (params[:step]).to_i
    @supplier = @purchase_order.supplier
  end

  # GET /purchase_orders/new
  def new
    @purchase_order = PurchaseOrder.new
    @purchase_order.order_items.build # Esto añade un objeto vacío para que `fields_for` lo reconozca
    @products = Product.all
  end

  # GET /purchase_orders/1/edit
  def edit
  end

  # POST /purchase_orders or /purchase_orders.json
  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    if @purchase_order.save
      redirect_to @purchase_order, notice: "Purchase order was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /purchase_orders/1 or /purchase_orders/1.json
  def update
    if @purchase_order.update(purchase_order_params)
      redirect_to @purchase_order, notice: "Purchase order was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /purchase_orders/1 or /purchase_orders/1.json
  def destroy
    @purchase_order.destroy!
    redirect_to purchase_orders_path, status: :see_other, notice: "Purchase order was successfully destroyed."
  end

  private

  def set_step
    redirect_to new_purchase_order_path(step: 1) unless params[:step].present?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_purchase_order
    @purchase_order = PurchaseOrder.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  # def purchase_order_params
  #   params.expect(purchase_order: [:delivery_date, :status, :order_date, :notes, :supplier_id, :payment_term_id,
  #                                  order_items_attributes: [:id, :product_id, :price, :quantity, :total_amount, :_destroy]])
  # end

  def purchase_order_params
    params.require(:purchase_order).permit(
      :delivery_date, :status, :order_date, :notes, :supplier_id, :payment_term_id,
      order_items_attributes: [:id, :product_id, :quantity, :price, :total_amount, :_destroy]
    )
  end
end
