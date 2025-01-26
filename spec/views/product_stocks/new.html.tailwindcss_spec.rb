require 'rails_helper'

RSpec.describe "product_stocks/new", type: :view do
  let(:product) { FactoryBot.create(:product) }

  before(:each) do
    assign(:product_stock, ProductStock.new(
      quantity: 1,
      product: product
    ))
  end

  it "renders new product_stock form" do
    render

    assert_select "form[action=?][method=?]", product_stocks_path, "post" do

      assert_select "input[name=?]", "product_stock[quantity]"

      assert_select "input[name=?]", "product_stock[product_id]"
    end
  end
end
