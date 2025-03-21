class AddFieldsToPurchaseOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :purchase_orders, :order_date, :date
    add_column :purchase_orders, :notes, :text
  end
end
