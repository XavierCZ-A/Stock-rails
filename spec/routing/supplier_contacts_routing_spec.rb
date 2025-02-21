require "rails_helper"

RSpec.describe SupplierContactsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/suppliers/1/contacts").to route_to("supplier_contacts#index", supplier_id: "1")
    end

    it "routes to #new" do
      expect(get: "/suppliers/1/contacts/new").to route_to("supplier_contacts#new", supplier_id: "1")
    end

    it "routes to #show" do
      expect(get: "/suppliers/1/contacts/1").to route_to("supplier_contacts#show", supplier_id: "1", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/suppliers/1/contacts/1/edit").to route_to("supplier_contacts#edit", supplier_id: "1", id: "1")
    end

    it "routes to #create" do
      expect(post: "/suppliers/1/contacts").to route_to("supplier_contacts#create", supplier_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/suppliers/1/contacts/1").to route_to("supplier_contacts#update", supplier_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/suppliers/1/contacts/1").to route_to("supplier_contacts#update", supplier_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/suppliers/1/contacts/1").to route_to("supplier_contacts#destroy", supplier_id: "1", id: "1")
    end
  end
end
