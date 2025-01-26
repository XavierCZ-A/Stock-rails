require 'rails_helper'

RSpec.describe "product_stocks/show", type: :view do
  let(:product) { FactoryBot.create(:product) }

  before(:each) do
    assign(:product_stock, ProductStock.create!(
      quantity: 2,
      product: product
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
