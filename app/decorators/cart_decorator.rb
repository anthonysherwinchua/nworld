class CartDecorator < SimpleDelegator

  attr_reader :subtotal, :shipping_price, :calculator

  def subtotal_value
    calculator = prepare_calculator
    @subtotal ||= calculator.subtotal
  end

  def subtotal
    "PHP #{subtotal_value}"
  end

  def total_weight
    calculator = prepare_calculator
    "#{calculator.total_weight} kg(s)"
  end

  def shipping_price_value
    calculator = prepare_calculator
    @shipping_price ||= calculator.shipping_price
  end

  def shipping_price
    "PHP #{shipping_price_value}"
  end

  def total_price
    calculator = prepare_calculator
    @total_price ||= calculator.total_price
    "PHP #{@total_price}"
  end

  private

  def prepare_calculator
    @calculator = CartCalculator.new(self)
  end

end
