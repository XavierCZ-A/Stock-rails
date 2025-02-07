require 'rails_helper'

RSpec.describe "supplier_contacts/new", type: :view do
  before(:each) do
    assign(:supplier_contact, SupplierContact.new(
      name: "MyString",
      last_name: "MyString",
      email: "MyString",
      phone: 1
    ))
  end

  it "renders new supplier_contact form" do
    render

    assert_select "form[action=?][method=?]", supplier_contacts_path, "post" do

      assert_select "input[name=?]", "supplier_contact[name]"

      assert_select "input[name=?]", "supplier_contact[last_name]"

      assert_select "input[name=?]", "supplier_contact[email]"

      assert_select "input[name=?]", "supplier_contact[phone]"
    end
  end
end
