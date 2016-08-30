class CheckoutsController < ApplicationController

  def new
    @client_token = prepare_client_token
  end

  def show
    @shopping_cart = Cart.find params[:id]
  end

  def create
    service = BraintreePaymentService.new(cart.id, params)

    if service.save
      session[:cart_id] = nil
      redirect_to checkout_path(service.cart.id)
    else
      flash[:error] = service.errors
      @client_token = prepare_client_token
      render new_checkout_path
    end
  end

  private

  def prepare_client_token
    Braintree::ClientToken.generate
  end

end
