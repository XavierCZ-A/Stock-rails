class RemoveTotalAmountFromPurchaseOrder < ActiveRecord::Migration[8.0]
  def change
    remove_column :purchase_orders, :total_amount, :decimal
  end
end
