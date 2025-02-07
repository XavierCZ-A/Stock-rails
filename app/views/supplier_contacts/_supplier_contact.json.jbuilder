json.extract! supplier_contact, :id, :name, :last_name, :email, :phone, :created_at, :updated_at
json.url supplier_contact_url(supplier_contact, format: :json)
