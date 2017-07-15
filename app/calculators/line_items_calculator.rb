class LineItemsCalculator

  attr_reader :line_items

  def initialize(cart)
    @line_items = cart.line_items
  end

  def subtotal
    line_items.inject(0) do |sum, line_item|
      sum += LineItemCalculator.new(line_item).subtotal
    end
  end

  def total_weight
    line_items.inject(0) do |sum, line_item|
      sum += LineItemCalculator.new(line_item).total_weight
    end
  end

end
