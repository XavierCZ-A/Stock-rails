require 'rails_helper'

RSpec.describe "purchase_orders/index", type: :view do
  before(:each) do
    assign(:purchase_orders, [
      PurchaseOrder.create!(
        quantity: 2,
        status: 3,
        price: "9.99",
        product: "Product",
        supplier: nil
      ),
      PurchaseOrder.create!(
        quantity: 2,
        status: 3,
        price: "9.99",
        product: "Product",
        supplier: nil
      )
    ])
  end

  it "renders a list of purchase_orders" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Product".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
