require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { FactoryBot.create(:category) }
  let(:product) { FactoryBot.build(:product, category: category) }

  context 'Validations' do
    it 'is valid with name, description, price present' do
      expect(product).to be_valid
    end

    it 'is invalid without a name' do
      product.name = nil
      expect(product).to_not be_valid
    end

    it 'is invalid without a description' do
      product.description = nil
      expect(product).to_not be_valid
    end

    it 'is invalid without a price' do
      product.price = nil
      expect(product).to_not be_valid
    end
  end

  context 'Associations' do
    it 'belongs to a category' do
      expect(product.category).to eq(category)
    end
  end

  context 'Should not be valid' do
    it 'when name is not present' do
      product.name = nil
      expect(product).not_to be_valid
    end

    it 'when price is not present' do
      product.price = nil
      expect(product).not_to be_valid
    end
  end

  context 'Price' do
    it 'should not be valid when price is not present' do
      product.price = nil
      expect(product).not_to be_valid
    end

    it 'should not be valid when price is than 0' do
      product.price = 0
      expect(product).not_to be_valid
    end
  end

end
