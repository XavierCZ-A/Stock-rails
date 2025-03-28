class CreateProductSizes < ActiveRecord::Migration[8.0]
  def change
    create_table :product_sizes do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :size, null: false, foreign_key: true

      t.timestamps
    end
  end
end
