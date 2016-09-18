class PaymentsController < ApplicationController

  def index
    @cart = cart
  end

  def show
    @cart = Cart.create(user_id: current_user&.id)
    session[:cart_id] = @cart.id
  end

end
