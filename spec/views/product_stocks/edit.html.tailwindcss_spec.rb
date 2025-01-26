require 'rails_helper'

RSpec.describe "product_stocks/edit", type: :view do
  let(:product) { FactoryBot.create(:product) }

  let(:product_stock) {
    ProductStock.create!(
      quantity: 1,
      product: product
    )
  }

  before(:each) do
    assign(:product_stock, product_stock)
  end

  it "renders the edit product_stock form" do
    render

    assert_select "form[action=?][method=?]", product_stock_path(product_stock), "post" do

      assert_select "input[name=?]", "product_stock[quantity]"

      assert_select "input[name=?]", "product_stock[product_id]"
    end
  end
end
