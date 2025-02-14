require 'rails_helper'

RSpec.describe "warehouses/new", type: :view do
  before(:each) do
    assign(:warehouse, Warehouse.new(
      name: "MyString",
      location: "MyString"
    ))
  end

  it "renders new warehouse form" do
    render

    assert_select "form[action=?][method=?]", warehouses_path, "post" do

      assert_select "input[name=?]", "warehouse[name]"

      assert_select "input[name=?]", "warehouse[location]"
    end
  end
end
