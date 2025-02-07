require 'rails_helper'

RSpec.describe "supplier_contacts/show", type: :view do
  before(:each) do
    assign(:supplier_contact, SupplierContact.create!(
      name: "Name",
      last_name: "Last Name",
      email: "Email",
      phone: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
  end
end
