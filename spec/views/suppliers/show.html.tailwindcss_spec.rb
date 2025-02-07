require 'rails_helper'

RSpec.describe "suppliers/show", type: :view do
  before(:each) do
    assign(:supplier, Supplier.create!(
      company_name: "Company Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Company Name/)
  end
end
