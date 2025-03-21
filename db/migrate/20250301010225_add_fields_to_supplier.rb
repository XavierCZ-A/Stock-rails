class AddFieldsToSupplier < ActiveRecord::Migration[8.0]
  def change
    add_column :suppliers, :name, :string
    add_column :suppliers, :phone, :string
    add_column :suppliers, :email, :string
    add_column :suppliers, :address, :string
  end
end
