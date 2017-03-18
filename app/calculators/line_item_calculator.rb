class LineItemCalculator

  attr_reader :line_item

  def initialize(line_item)
    @line_item = line_item
  end

  def subtotal
    @subttotal ||= line_item.product.price * line_item.quantity
  end

  def total_weight
    @total_weight ||= line_item.product.weight * line_item.quantity
  end

end
