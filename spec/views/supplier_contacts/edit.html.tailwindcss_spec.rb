require 'rails_helper'

RSpec.describe "supplier_contacts/edit", type: :view do
  let(:supplier_contact) {
    SupplierContact.create!(
      name: "MyString",
      last_name: "MyString",
      email: "MyString",
      phone: 1
    )
  }

  before(:each) do
    assign(:supplier_contact, supplier_contact)
  end

  it "renders the edit supplier_contact form" do
    render

    assert_select "form[action=?][method=?]", supplier_contact_path(supplier_contact), "post" do

      assert_select "input[name=?]", "supplier_contact[name]"

      assert_select "input[name=?]", "supplier_contact[last_name]"

      assert_select "input[name=?]", "supplier_contact[email]"

      assert_select "input[name=?]", "supplier_contact[phone]"
    end
  end
end
