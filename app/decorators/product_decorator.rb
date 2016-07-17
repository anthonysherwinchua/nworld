class ProductDecorator < SimpleDelegator

  def selling_price
    "PHP #{price}"
  end

  def packaged_weight
    "#{weight} kg(s) / #{unit}"
  end

end
