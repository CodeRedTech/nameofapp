class SimplePagesController < ApplicationController
  def index
  end 
    
  def landing_page
    @products = Product.limit(3)
    @featured_product = Product.last
  end

end
