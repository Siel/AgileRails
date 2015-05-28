require 'test_helper'

class ProductTest < ActiveSupport::TestCase

	fixtures :products

	test "product's title must be unique" do
		product = Product.new(title: products(:ruby).title,
													description: "yyy",
													price: 1,
													image_url: "test.png")
		assert product.invalid?
		assert_equal ["has already been taken"], product.errors[:title]
	end

	test "product's title have at least 10 characters" do
		product = Product.new(description: "yyy",
													price: 1,
													image_url: "test.png")
		product.title = 'abcdefghi'# length: 9
		assert product.invalid?

		product.title = 'abcdefghij'# length: 10
		assert product.valid?

		product.title = 'abcdefghijk'# length: 11
		assert product.valid?
	end

  test "product attributes must not be empty" do
  	product = Product.new
  	#this is an empty product
  	#I'm validating that all the asserts are true
  	assert product.invalid?
  	assert product.errors[:title].any?
  	assert product.errors[:description].any?
  	assert product.errors[:price].any?
  	assert product.errors[:image_url].any?
  end 

  test "product price must be positive" do
  	product = Product.new(
  			title: 'My Book Title',
  			description: 'anything',
  			image_url: 'test.jpg'
  		)
  	product.price = -1
  	assert product.invalid?#este producto tiene que ser invalido
  	assert_equal ["must be greater than or equal to 0.01"],
  		product.errors[:price]

  	product.price = 0
  	assert product.invalid?#este producto tiene que ser invalido
  	assert_equal ["must be greater than or equal to 0.01"],
  		product.errors[:price]

  	product.price = 1
  	assert product.valid?
  end

  test "image_url" do
  	product = Product.new(
  			title: 'My Book Title',
  			description: 'anything',
  			price: 1
  		)

  	ok = %W{fred.gif fred.jpg fred.png FRED.JPG Fred.jpg
  		http://a.b.c/x/y/z/fred.gif }
  	bad = %W{fred.doc fred.gif/more fred.gif.more}

  	ok.each do |url|
  		product.image_url = url
  		assert product.valid?, "#{name} should be valid"
  	end
	
	bad.each do |url|
		product.image_url = url
		assert product.invalid?, "#{name} shouldn't be valid"
	end  
  end
end