class CreateSupplierContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :supplier_contacts do |t|
      t.string :name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.integer :phone, null: false

      t.timestamps
    end
  end
end
