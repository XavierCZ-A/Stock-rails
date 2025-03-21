class RemoveFieldsFromPurchaseOrder < ActiveRecord::Migration[8.0]
  def change
    remove_column :purchase_orders, :product, :string
    remove_column :purchase_orders, :quantity, :integer
  end
end
