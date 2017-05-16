class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
  end

  def checkout
    @guest = Guest.new
  end

  def confirm
    @guest = Guest.new(guest_parameter)
    @guest.order = current_order
    if @guest.save
      session[:order_id] = nil
      redirect_to thank_you_path
    else
      render :checkout
    end
  end

  private

  def guest_parameter
    params.require(:guest).permit(:name, :address, :phone_number)
  end
end
