require 'rails_helper'

RSpec.describe "Products", type: :request do
  before do
    login_user
  end
  let(:category) { FactoryBot.create(:category) }
  let(:product) { FactoryBot.create(:product) }

  describe 'GET /products' do
    it 'returns a success response' do
      get products_path
      expect(response).to be_successful
    end
  end

  describe 'GET /products/new' do
    it 'returns a success response' do
      get new_product_path
      expect(response).to be_successful
    end
  end

  describe 'POST /products' do
    context 'with valid parameters' do
      category = FactoryBot.create(:category) # Crea una categoría
      it 'creates a new Product' do
        expect {
          post products_path, params: { product: FactoryBot.attributes_for(:product).merge(category_id: category.id) }
        }.to change(Product, :count).by(1)
      end

      it 'redirects to the created product' do
        post products_path, params: { product: FactoryBot.attributes_for(:product).merge(category_id: category.id) }
        expect(response).to redirect_to(products_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Product' do
        expect {
          post products_path, params: { product: FactoryBot.attributes_for(:product, name: nil) }
        }.to change(Product, :count).by(0)
      end

      it "returns a success response (i.e. to display the 'new' template)" do
        post products_path, params: { product: FactoryBot.attributes_for(:product, name: nil) }
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH /Products" do
    context "with valid parameters" do
      it "should update a product with valid attributes" do
        patch product_path(product), params: { product: FactoryBot.attributes_for(:product) }
        expect(response).to redirect_to product_path(product)
        expect(flash[:notice]).to eq 'Product was successfully updated.'
      end
    end
  end

  describe "Search /products" do
    it "should search products by name" do
      get products_path, params: { query_text: product.name }
      expect(response).to be_successful
    end
  end

end
