require 'rails_helper'

RSpec.describe "warehouses/index", type: :view do
  before(:each) do
    assign(:warehouses, [
      Warehouse.create!(
        name: "Name",
        location: "Location"
      ),
      Warehouse.create!(
        name: "Name",
        location: "Location"
      )
    ])
  end

  it "renders a list of warehouses" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Location".to_s), count: 2
  end
end
