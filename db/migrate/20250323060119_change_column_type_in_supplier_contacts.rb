class ChangeColumnTypeInSupplierContacts < ActiveRecord::Migration[8.0]
  def change
    change_column :supplier_contacts, :phone, :string
  end
end
