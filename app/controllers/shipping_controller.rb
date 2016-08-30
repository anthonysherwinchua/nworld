class ShippingController < ApplicationController

  def update
    @cart_manager = prepare_cart_manager

    if @cart_manager.update_shipping_country(shippable_country_params)
      redirect_to shopping_cart_path, flash: { notice: 'Successfully updated shopping cart' }
    else
      redirect_to shopping_cart_path, flash: { error: @cart_manager.errors.to_sentence }
    end
  end

  private

  def shippable_country_params
    params.require(:shipping).permit(:shippable_country)
  end

  def prepare_cart_manager
    CartManager.new(cart.id)
  end

end
