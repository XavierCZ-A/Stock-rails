require 'rails_helper'

RSpec.describe "purchase_orders/new", type: :view do
  before(:each) do
    assign(:purchase_order, PurchaseOrder.new(
      quantity: 1,
      status: 1,
      price: "9.99",
      product: "MyString",
      supplier: nil
    ))
  end

  it "renders new purchase_order form" do
    render

    assert_select "form[action=?][method=?]", purchase_orders_path, "post" do

      assert_select "input[name=?]", "purchase_order[quantity]"

      assert_select "input[name=?]", "purchase_order[status]"

      assert_select "input[name=?]", "purchase_order[price]"

      assert_select "input[name=?]", "purchase_order[products]"

      assert_select "input[name=?]", "purchase_order[supplier_id]"
    end
  end
end
