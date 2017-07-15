class CartCalculator

  attr_reader :cart

  def initialize(cart)
    @cart = cart
  end

  def subtotal
    @subtotal ||= LineItemsCalculator.new(cart).subtotal
  end

  def shipping_price
    @shipping_price ||= ShippingCalculator.new(cart).shipping_price
  end

  def total_price
    @total_price ||= subtotal + shipping_price
  end

  def total_price_in_cent
    @total_price_in_cent ||= (total_price * 100).round
  end

end
