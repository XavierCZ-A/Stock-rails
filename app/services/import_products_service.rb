require "csv"

class ImportProductsService
  def initialize(file)
    @file = file
  end

  def call
    CSV.foreach(@file.path, headers: true) do |row|
      product = Product.create!(name: row["name"], description: row["description"], price: row["price"], category_id: row["category_id"], created_at: row["created_at"], updated_at: row["updated_at"])
      product
      pp product
    end
  end
end
