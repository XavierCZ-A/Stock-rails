class AddOrderNumberToPurchaseOrder < ActiveRecord::Migration[8.0]
  def change
    add_column :purchase_orders, :order_number, :string, null: false
  end
end
