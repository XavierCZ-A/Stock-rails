class CreateSuppliers < ActiveRecord::Migration[8.0]
  def change
    create_table :suppliers do |t|
      t.string :company_name, null: false

      t.timestamps
    end
  end
end
