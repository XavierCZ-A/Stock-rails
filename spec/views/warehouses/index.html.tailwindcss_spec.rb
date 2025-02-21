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
    # Buscar "Name" en los <h2> y "Location" en los <p>
    assert_select 'h2', text: Regexp.new("Name"), count: 2
    assert_select 'p', text: Regexp.new("Location"), count: 2
  end

end
