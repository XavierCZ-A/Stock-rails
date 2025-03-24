class AddFieldsToPurchaseOrder < ActiveRecord::Migration[8.0]
  def change
    add_column :purchase_orders, :delivery_address, :string
    add_column :purchase_orders, :delivery_city, :string
    add_column :purchase_orders, :delivery_postal_code, :string
    add_column :purchase_orders, :delivery_province, :string
  end
end
