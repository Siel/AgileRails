class StoreController < ApplicationController
  def index
  	#display the products in alphabetical order
  	@products = Product.order(:title)
  end
end
