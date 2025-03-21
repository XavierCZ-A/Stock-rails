require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create products" do
    assert_difference("Product.count") do
      post products_url, params: { product: { description: @product.description, name: @product.name, price: @product.price } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show products" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update products" do
    patch product_url(@product), params: { product: { description: @product.description, name: @product.name, price: @product.price } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy products" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
