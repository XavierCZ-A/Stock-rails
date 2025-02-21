require 'rails_helper'

RSpec.describe "product_stocks/show", type: :view do
  let(:product) { FactoryBot.create(:product) }
  let(:warehouse) { FactoryBot.create(:warehouse) }

  before(:each) do
    assign(:product_stock, ProductStock.create!(
      quantity: 2,
      product: product,
      warehouse: warehouse,
      notification_stock: 0
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
