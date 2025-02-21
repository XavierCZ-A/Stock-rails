require 'rails_helper'

RSpec.describe "supplier_contacts/edit", type: :view do
  let!(:supplier) { create(:supplier) }
  let!(:supplier_contact) { create(:supplier_contact, supplier: supplier) }

  before do
    assign(:supplier, supplier)
    assign(:supplier_contact, supplier_contact)
    render
  end

  it "muestra el formulario para editar un contacto de proveedor" do
    expect(rendered).to have_selector('form')
    expect(rendered).to have_field('Name', with: supplier_contact.name)
    expect(rendered).to have_field('Last name', with: supplier_contact.last_name)
    expect(rendered).to have_field('Email', with: supplier_contact.email)
    expect(rendered).to have_field('Phone', with: supplier_contact.phone)

    expect(rendered).to have_selector("form[action='#{supplier_supplier_contact_path(supplier, supplier_contact)}']")
  end

  it "muestra un enlace para volver a los contactos del proveedor" do
    expect(rendered).to have_link('Back to supplier contacts', href: supplier_supplier_contacts_path(supplier))
  end
end
