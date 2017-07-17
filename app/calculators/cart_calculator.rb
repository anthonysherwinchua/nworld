class CartCalculator

  attr_reader :cart

  def initialize(cart)
    @cart = cart
  end

  def line_items_price
    @line_items_price ||= LineItemsCalculator.new(cart).total_price
  end

  def shipping_price
    @shipping_price ||= ShippingCalculator.new(cart).total_price
  end

  def discount_price
    @discount_price ||= DiscountCalculator.new(cart).total_price
  end

  def processing_fee
    @processing_fee ||= subtotal_price.to_f * 0.05
  end

  def subtotal_price
    @subtotal_price ||= line_items_price + shipping_price - discount_price
  end

  def total_price
    @total_price ||= subtotal_price + processing_fee
  end

  def total_price_in_cent
    @total_price_in_cent ||= (total_price * 100).round
  end

end
