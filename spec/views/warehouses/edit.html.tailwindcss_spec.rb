require 'rails_helper'

RSpec.describe "warehouses/edit", type: :view do
  let(:warehouse) {
    Warehouse.create!(
      name: "MyString",
      location: "MyString"
    )
  }

  before(:each) do
    assign(:warehouse, warehouse)
  end

  it "renders the edit warehouse form" do
    render

    assert_select "form[action=?][method=?]", warehouse_path(warehouse), "post" do

      assert_select "input[name=?]", "warehouse[name]"

      assert_select "input[name=?]", "warehouse[location]"
    end
  end
end
