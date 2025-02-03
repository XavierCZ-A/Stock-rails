class AddNotificationToProductStock < ActiveRecord::Migration[8.0]
  def change
    add_column :product_stocks, :notification_stock, :boolean, default: 0
    add_column :product_stocks, :min_stock, :integer
  end
end
