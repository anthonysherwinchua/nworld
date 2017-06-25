class CartDecorator < SimpleDelegator

  attr_reader :subtotal, :shipping_price, :calculator

  def subtotal_value
    @subtotal ||= calculator.subtotal
  end

  def subtotal
    @subtotal ||= "PHP #{subtotal_value}"
  end

  def discount_total
    @discount_total ||= "PHP #{calculator.discount_price}"
  end

  def total_weight
    @total_weight ||= "#{calculator.total_weight} kg(s)"
  end

  def shipping_price_value
    @shipping_price ||= calculator.shipping_price
  end

  def shipping_price
    @shipping_price ||= "PHP #{shipping_price_value}"
  end

  def total_price
    @total_price ||= "PHP #{calculator.total_price}"
  end

  private

  def calculator
    @calculator = CartCalculator.new(self)
  end

end
