# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Size.create!([
#   { name: "XS" },
#   { name: "M" },
#   { name: "L" },
#   { name: "XL" },
#              ])

# Category.create!([
#   { name: "Electronics" },
#   { name: "Clothing" },
#   { name: "Books" },
#   { name: "Home & Garden" },
#   { name: "Health & Beauty" },
#   { name: "Toys & Hobbies" },
#   { name: "Sporting Goods" },
#                  ])