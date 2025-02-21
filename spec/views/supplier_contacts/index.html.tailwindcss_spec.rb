require 'rails_helper'

RSpec.describe "supplier_contacts/index", type: :view do
  let(:supplier) { FactoryBot.create(:supplier) }  # Asegúrate de crear un proveedor

  before(:each) do
    assign(:supplier, supplier)  # Asigna el proveedor a la vista
    assign(:supplier_contacts, [
      SupplierContact.create!(
        name: "Name",
        last_name: "Last Name",
        email: "email@example.com",
        phone: "1563",
        supplier: supplier
      ),
      SupplierContact.create!(
        name: "Name2",
        last_name: "Last Name2",
        email: "email2@example.com",
        phone: "8956",
        supplier: supplier
      )
    ])
  end

  it "renders a list of supplier_contacts" do
    render
    # Asegúrate de que se renderizan los contactos
    assert_select 'div>p', count: 8
  end
end
