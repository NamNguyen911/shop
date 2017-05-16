class OrdersController < ApplicationController
  load_and_authorize_resource

  def index
    @orders = Order.all
  end

  def fulfill
    @order.transaction do
      @order.update(status: 'placed')
      @order.order_items.each do |oi|
        oi.product.update(quantity: oi.product.quantity - oi.quantity)
      end
    end
    redirect_to action: "index"
  end
end
