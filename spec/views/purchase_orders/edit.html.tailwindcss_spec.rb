require 'rails_helper'

RSpec.describe "purchase_orders/edit", type: :view do
  let(:purchase_order) {
    PurchaseOrder.create!(
      quantity: 1,
      status: 1,
      price: "9.99",
      product: "MyString",
      supplier: nil
    )
  }

  before(:each) do
    assign(:purchase_order, purchase_order)
  end

  it "renders the edit purchase_order form" do
    render

    assert_select "form[action=?][method=?]", purchase_order_path(purchase_order), "post" do

      assert_select "input[name=?]", "purchase_order[quantity]"

      assert_select "input[name=?]", "purchase_order[status]"

      assert_select "input[name=?]", "purchase_order[price]"

      assert_select "input[name=?]", "purchase_order[products]"

      assert_select "input[name=?]", "purchase_order[supplier_id]"
    end
  end
end
