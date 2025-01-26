require 'rails_helper'

RSpec.describe "product_stocks/index", type: :view do
  let(:product) { FactoryBot.create(:product) }

  before(:each) do
    assign(:product_stocks, [
      ProductStock.create!(
        quantity: 2,
        product: product
      ),
      ProductStock.create!(
        quantity: 2,
        product: product
      )
    ])
  end

  it "renders a list of product_stocks" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(product.name.to_s), count: 2
  end
end
