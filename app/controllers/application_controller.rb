class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  helper_method [:current_order, :categories]
  before_action :set_locale

  def set_locale
    # I18n.locale = params[:locale] || I18n.default_locale
    I18n.locale = :en
  end

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

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :password, :remember_me)
    end
  end
end
