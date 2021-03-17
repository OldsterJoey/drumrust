class PagesController < ApplicationController
  def home
  end
  
  def payment_success
    product_id = params[:productId]
    @product = Product.find(product_id)
    @paid = Purchase.find_by_product_id(product_id)
  end
end
