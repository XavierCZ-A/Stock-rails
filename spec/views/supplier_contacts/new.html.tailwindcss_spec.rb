require 'rails_helper'

RSpec.describe "supplier_contacts/new", type: :view do
  let(:supplier) { create(:supplier) }
  let(:supplier_contact) { build(:supplier_contact, supplier: supplier) }

  before do
    assign(:supplier, supplier)
    assign(:supplier_contact, supplier_contact)
    render
  end

  it "muestra el formulario para crear un nuevo contacto" do
    expect(rendered).to have_selector("form")
    expect(rendered).to have_field("Name")
    expect(rendered).to have_field("Last name")
    expect(rendered).to have_field("Email")
    expect(rendered).to have_field("Phone")
    expect(rendered).to have_button("Create Supplier contact")
  end
end
