class OrderItemsController < ApplicationController
  before_action :set_step, only: %i[ new ]
  before_action :set_purchase_order
  layout 'product'

  def index
  end

  def new
    @order_item = OrderItem.new
  end

  def create
    @order_item = OrderItem.new(order_item_params)
    @order_item.purchase_order_id = @purchase_order.id
    if @order_item.save
      redirect_to purchase_order_path(@purchase_order), notice: "Order item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_step
    @current_step = (params[:step]).to_i
  end

  def set_purchase_order
    @purchase_order = PurchaseOrder.find(params[:purchase_order_id])
  end

  def order_item_params
    params.expect(order_item: [:quantity, :product_id, :price, :total_amount, :purchase_order_id])
  end
end
