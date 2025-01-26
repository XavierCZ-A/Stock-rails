require "rails_helper"

RSpec.describe ProductStocksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/product_stocks").to route_to("product_stocks#index")
    end

    it "routes to #new" do
      expect(get: "/product_stocks/new").to route_to("product_stocks#new")
    end

    it "routes to #show" do
      expect(get: "/product_stocks/1").to route_to("product_stocks#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/product_stocks/1/edit").to route_to("product_stocks#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/product_stocks").to route_to("product_stocks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/product_stocks/1").to route_to("product_stocks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/product_stocks/1").to route_to("product_stocks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/product_stocks/1").to route_to("product_stocks#destroy", id: "1")
    end
  end
end
