class OrdersController < ApplicationController
  load_and_authorize_resource

  def index
    status = params[:status] || 'processing'
    @orders = Order.where(status: status)

    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def fulfill
    @order.transaction do
      @order.update(status: 'placed')
      @order.order_items.each do |oi|
        oi.product.update(quantity: oi.product.quantity - oi.quantity)
      end
    end
    redirect_to orders_path, format: :js
  end

  def cancel
    # need to pass status because both processing and placed order can be cancelled
    status = @order.status
    @order.cancel
    redirect_to orders_path(status: status), format: :js
  end

  def finish
    @order.update(status: 'shipped')
    redirect_to orders_path(status: "placed"), format: :js
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :city, :phone, :email, :note)
  end
end
