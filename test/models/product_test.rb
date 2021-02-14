require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  test "create a product" do
    product = products(:product_one)
    product.images.attach(io: File.open(file_fixture('default-product-image.webp')), filename: 'default-product-image.webp')
    assert product.valid?, "Product valid with all atrtributes"
  end
  
  test "create a product without name" do
    product = products(:product_two)
    product.images.attach(io: File.open(file_fixture('default-product-image.webp')), filename: 'default-product-image.webp')
    assert_not product.valid?, "Product invalid without name"
  end
  
  test "create a product without discription" do
    product = products(:product_three)
    product.images.attach(io: File.open(file_fixture('default-product-image.webp')), filename: 'default-product-image.webp')
    assert_not product.valid?, "Product invalid without discription"
  end
  
  test "create a product without price" do
    product = products(:product_four)
    product.images.attach(io: File.open(file_fixture('default-product-image.webp')), filename: 'default-product-image.webp')
    assert_not product.valid?, "Product invalid without price"
  end
  
  test "create a product without name and discription" do
    product = products(:product_five)
    product.images.attach(io: File.open(file_fixture('default-product-image.webp')), filename: 'default-product-image.webp')
    assert_not product.valid?, "Product invalid without name and discription"
  end
  
  test "create a product without discription and price" do
    product = products(:product_six)
    product.images.attach(io: File.open(file_fixture('default-product-image.webp')), filename: 'default-product-image.webp')
    assert_not product.valid?, "Product invalid without discription and price"
  end
  
  test "create a product without name and price" do
    product = products(:product_seven)
    product.images.attach(io: File.open(file_fixture('default-product-image.webp')), filename: 'default-product-image.webp')
    assert_not product.valid?, "Product invalid without name and price"
  end
  
  test "create a product without name, discription price" do
    product = products(:product_eight)
    product.images.attach(io: File.open(file_fixture('default-product-image.webp')), filename: 'default-product-image.webp')
    assert_not product.valid?, "Product invalid without name, discription price"
  end
  
  test "create a product without images" do
    product = products(:product_one)
    assert_not product.valid?, "Product invalid without images"
  end
  
  test "update a product without images" do
    product = products(:product_one)
    product.images.attach(io: File.open(file_fixture('default-product-image.webp')), filename: 'default-product-image.webp')
    product.images.attach(io: File.open(file_fixture('default-product-image.webp')), filename: 'default-product-image.webp')
    product.images.attach(io: File.open(file_fixture('default-product-image.webp')), filename: 'default-product-image.webp')
    product.images.attach(io: File.open(file_fixture('default-product-image.webp')), filename: 'default-product-image.webp')
    product.images.purge
    assert_not product.valid?, "Product update invalid without images"
  end
  
  test "update a product with images" do
    product = products(:product_one)
    product.images.attach(io: File.open(file_fixture('default-product-image.webp')), filename: 'default-product-image.webp')
    assert product.update(name: "asdas"), "Product upadte valid with images"
  end
  
  test "delete one image from product" do
    product = products(:product_one)
    product.images.attach(io: File.open(file_fixture('default-product-image.webp')), filename: 'default-product-image.webp')
    product.images.attach(io: File.open(file_fixture('default-product-image.webp')), filename: 'default-product-image.webp')
    product.images.attach(io: File.open(file_fixture('default-product-image.webp')), filename: 'default-product-image.webp')
    product.images.attach(io: File.open(file_fixture('default-product-image.webp')), filename: 'default-product-image.webp')
    product.images.first.purge
    assert product.valid?, "Product valid after deleting one image"
  end
end
