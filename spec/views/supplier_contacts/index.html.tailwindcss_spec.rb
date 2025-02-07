require 'rails_helper'

RSpec.describe "supplier_contacts/index", type: :view do
  before(:each) do
    assign(:supplier_contacts, [
      SupplierContact.create!(
        name: "Name",
        last_name: "Last Name",
        email: "Email",
        phone: 2
      ),
      SupplierContact.create!(
        name: "Name",
        last_name: "Last Name",
        email: "Email",
        phone: 2
      )
    ])
  end

  it "renders a list of supplier_contacts" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
