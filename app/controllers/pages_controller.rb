class PagesController < ApplicationController
  def home
  end

  def payment_success
    pp params
    product_id = params[:productId]
    @product = Product.find(product_id)
    @paid = Purchase.find_by_product_id(product_id)
  end
end
# Allows sorting of Products by category
def categorize
  if params.has_key?(:category)
    @category = Category.find_by_name(params[:category])
    @product = Product.where(category: @category)
  else
    @product = Product.all
  end
end