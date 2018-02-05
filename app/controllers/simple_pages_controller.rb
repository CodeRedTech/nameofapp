class SimplePagesController < ApplicationController
  def index
    
  def landing_page
    @featured_product = Product.first
  end

end
