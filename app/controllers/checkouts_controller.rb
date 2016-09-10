class CheckoutsController < ApplicationController

  def new
  end

  def show
    @shopping_cart = Cart.find params[:id]
  end

  def create
    service = PaymentService.new(cart.id, params)

    if service.save
      session[:cart_id] = nil
      redirect_to checkout_path(service.cart.id)
    else
      flash[:error] = service.errors
      render new_checkout_path
    end
  end


end
