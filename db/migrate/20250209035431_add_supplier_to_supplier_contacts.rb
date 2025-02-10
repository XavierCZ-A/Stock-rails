class AddSupplierToSupplierContacts < ActiveRecord::Migration[8.0]
  def change
    add_reference :supplier_contacts, :supplier, null: false, foreign_key: true
  end
end
