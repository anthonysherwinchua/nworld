class LineItemDecorator < SimpleDelegator

  def subtotal
    "PHP #{LineItemCalculator.new(self).subtotal}"
  end

end
