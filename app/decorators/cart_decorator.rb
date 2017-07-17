class CartDecorator < SimpleDelegator

  attr_reader :subtotal, :shipping_price, :calculator

  def subtotal_value
    @subtotal_value ||= calculator.line_items_price.round(2)
  end

  def subtotal
    @subtotal ||= "PHP #{subtotal_value.round(2)}"
  end

  def discount_total
    @discount_total ||= "PHP #{calculator.discount_price.round(2)}"
  end

  def total_weight
    @total_weight ||= "#{calculator.total_weight} kg(s)"
  end

  def shipping_price_value
    @shipping_price_value ||= calculator.shipping_price.round(2)
  end

  def shipping_price
    @shipping_price ||= "PHP #{shipping_price_value}"
  end

  def processing_fee
    @processing_fee ||= "PHP #{calculator.processing_fee.round(2)}"
  end

  def total_price
    @total_price ||= "PHP #{calculator.total_price.round(2)}"
  end

  private

  def calculator
    @calculator = CartCalculator.new(self)
  end

end
