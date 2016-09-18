class ShoppingCartsController < ApplicationController

  def index
    @form = Cart::ContactDetailUpdateForm.new(cart)
  end

end
