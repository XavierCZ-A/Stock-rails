require 'rails_helper'

RSpec.describe "product_stocks/index", type: :view do
  let(:product) { FactoryBot.create(:product) }
  let(:warehouse) { FactoryBot.create(:warehouse) }

  before(:each) do
    assign(:product_stocks, [
      ProductStock.create!(
        quantity: 2,
        product: product,
        warehouse: warehouse,
        notification_stock: 0
      ),
      ProductStock.create!(
        quantity: 2,
        product: product,
        warehouse: warehouse,
        notification_stock: 0
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
