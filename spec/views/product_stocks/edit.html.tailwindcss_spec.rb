require 'rails_helper'

RSpec.describe "product_stocks/edit", type: :view do
  let(:product) { FactoryBot.create(:product) }
  let(:warehouse) { FactoryBot.create(:warehouse) }

  let(:product_stock) {
    ProductStock.create!(
      quantity: 1,
      product: product,
      warehouse: warehouse,
      notification_stock: 0
    )
  }

  before(:each) do
    assign(:product_stock, product_stock)
  end

  it "renders the edit product_stock form" do
    render

    assert_select "form[action=?][method=?]", product_stock_path(product_stock), "post" do

      assert_select "input[name=?]", "product_stock[quantity]"

      assert_select "select[name=?]", "product_stock[product_id]"

      assert_select "select[name=?]", "product_stock[warehouse_id]"

      assert_select "input[name=?]", "product_stock[notification_stock]"

    end
  end
end
