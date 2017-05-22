class ProductsController < ApplicationController
  load_and_authorize_resource

  def index
    @products = Product.all
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
    @order_item = @product.order_items.new
  end

  def add
    @order = current_order
    @order_item = @order.order_items.new(quantity: 1, product_id: @product.id)
    @order.save
    session[:order_id] = @order.id
    render json: @order.order_items.size
  end
end
