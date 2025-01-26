class CreateProductStocks < ActiveRecord::Migration[8.0]
  def change
    create_table :product_stocks do |t|
      t.integer :quantity
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
