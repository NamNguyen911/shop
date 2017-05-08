class CartsController < ApplicationController
  def show
    @current_order = current_order
  end
end
