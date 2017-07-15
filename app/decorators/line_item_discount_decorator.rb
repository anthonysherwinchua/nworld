class LineItemDiscountDecorator < SimpleDelegator

  def unit_discount
    "PHP #{amount} (#{source})"
  end

end
