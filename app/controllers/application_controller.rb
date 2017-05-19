class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method [:current_order, :categories]

  def categories
    Category.all
  end

  def current_order
    unless session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
