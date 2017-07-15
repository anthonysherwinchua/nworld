class LineItemDecorator < SimpleDelegator

  def unit_price
    "PHP #{super}"
  end

  def subtotal
    "PHP #{LineItemCalculator.new(self).subtotal}"
  end

end
