class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
  end

  def checkout
    @order_items = current_order.order_items
    @guest = Guest.new
  end

  def confirm
    @guest = Guest.find_or_initialize_by(email: guest_parameter[:email])
    @guest.update_attributes(guest_parameter)
    @guest.orders << current_order
    if @guest.save
      session[:order_id] = nil
      redirect_to thank_you_path
    else
      @guest = Guest.new
      @order_items = current_order.order_items
      render :checkout
    end
  end

  def update
    @order_items = current_order.order_items
    changes = order_items_parameter[:change]
    #@order_items.update(
    changes.each do |id, quantity|
      @order_items.where(id: id).update(quantity: quantity)
    end
    render layout: false
  end

  private

  def guest_parameter
    params.require(:guest).permit(:name, :address, :phone_number, :email, :city, :note)
  end

  def order_items_parameter
    # params.require(:order).permit(:quantity)
    params.require(:order).tap do |whitelisted|
        whitelisted[:change] = params[:order][:change]
    end
  end
end
