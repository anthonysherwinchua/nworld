class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(_resource)
    admin_root_path
  end

  def cart
    @cart ||= Cart.find_by(id: session[:cart_id]) || Cart.create(user_id: current_user&.id)
    session[:cart_id] ||= @cart.id
    @cart
  end
  helper_method :cart

end
