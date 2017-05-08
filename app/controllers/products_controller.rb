class ProductsController < ApplicationController
  load_and_authorize_resource

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @order_item = @product.order_items.new()
  end
end
