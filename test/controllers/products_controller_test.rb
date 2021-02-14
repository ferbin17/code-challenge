require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  def find_company
    @company = companies(:hometown_painting)
  end
  
  def find_product
    @product = products(:product_one)
    @product.images.attach(fixture_file_upload('files/default-product-image.webp','application/webp'))
    @product.save
  end
  
  test "displays all products" do
    get products_path
    assert_response :success
  end

  test "displays a single product" do
    find_product
    find_company
    get company_product_path(@company, @product)
    assert_response :success
  end
end
