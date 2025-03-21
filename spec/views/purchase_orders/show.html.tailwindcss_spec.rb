require 'rails_helper'

RSpec.describe "purchase_orders/show", type: :view do
  before(:each) do
    assign(:purchase_order, PurchaseOrder.create!(
      quantity: 2,
      status: 3,
      price: "9.99",
      product: "Product",
      supplier: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Product/)
    expect(rendered).to match(//)
  end
end
