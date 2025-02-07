require "rails_helper"

RSpec.describe SupplierContactsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/supplier_contacts").to route_to("supplier_contacts#index")
    end

    it "routes to #new" do
      expect(get: "/supplier_contacts/new").to route_to("supplier_contacts#new")
    end

    it "routes to #show" do
      expect(get: "/supplier_contacts/1").to route_to("supplier_contacts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/supplier_contacts/1/edit").to route_to("supplier_contacts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/supplier_contacts").to route_to("supplier_contacts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/supplier_contacts/1").to route_to("supplier_contacts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/supplier_contacts/1").to route_to("supplier_contacts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/supplier_contacts/1").to route_to("supplier_contacts#destroy", id: "1")
    end
  end
end
