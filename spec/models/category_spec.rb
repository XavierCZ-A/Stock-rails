require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Associations' do
    it 'has many products' do
      # Crear una categoría usando Factory Bot
      category = create(:category)

      # Crear productos asociados a la categoría
      product1 = create(:product, category: category)
      product2 = create(:product, category: category)

      # Verificar que los productos asociados sean correctos
      expect(category.products).to include(product1, product2)
    end
  end
end
