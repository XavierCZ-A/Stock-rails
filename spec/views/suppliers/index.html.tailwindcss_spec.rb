require 'rails_helper'

RSpec.describe "suppliers/index", type: :view do
  before(:each) do
    assign(:suppliers, [
      Supplier.create!(
        company_name: "Company Name"
      ),
      Supplier.create!(
        company_name: "Company Name"
      )
    ])
  end

  it "renders a list of suppliers" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Company Name".to_s), count: 2
  end
end
