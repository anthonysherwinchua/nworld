class LineItemsCalculator

  attr_reader :cart

  def initialize(cart)
    @cart = cart
  end

  def total_price
    @total_price ||= cart.line_items.inject(0) do |sum, line_item|
      sum += LineItemCalculator.new(line_item).subtotal
    end
  end

  def total_weight
    @total_weight ||= cart.line_items.inject(0) do |sum, line_item|
      sum += LineItemCalculator.new(line_item).total_weight
    end
  end

end
