class CreatePurchaseOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :purchase_orders do |t|
      t.integer :quantity, null: false
      t.date :delivery_date, null: false
      t.integer :status, default: 0
      t.decimal :total_amount, precision: 10, scale: 2, null: false
      t.string :product, null: false
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
