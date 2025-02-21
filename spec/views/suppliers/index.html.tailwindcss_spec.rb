require 'rails_helper'

RSpec.describe "suppliers/index", type: :view do
  it "renders a list of suppliers" do
    assign(:suppliers, [
      Supplier.create!(company_name: "Supplier One"),
      Supplier.create!(company_name: "Supplier Two")
    ])

    render

    expect(rendered).to include("Supplier One")
    expect(rendered).to include("Supplier Two")
  end
end
