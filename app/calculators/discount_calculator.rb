class DiscountCalculator

  attr_reader :cart

  def initialize(cart)
    @cart = cart
  end

  def total_price
    cart.line_items.inject(0) do |sum, line_item|
      sum += line_item.line_item_discounts.sum(:amount)
    end
  end

  def recalculate!
    cart.transaction do
      clear_discounts
      calculate_discounts
    end
  end

  private

  def clear_discounts
    cart.line_items.each {|line_item| line_item.line_item_discounts.destroy_all }
  end

  def calculate_discounts
    return if cart.user.blank?
    create_retailer_discounts if cart.user.has_role? 'retailer' || (cart.user.has_role? 'wholesale' && LineItemsCalculator.new(cart).total_price < 16_500)
    create_wholesaler_discounts if cart.user.has_role? 'wholesaler'
  end

  def create_retailer_discounts
    running_total = 0
    sorted_line_items.each do |line_item|
      # virtually separates the line items
      (1).upto(line_item.quantity) do
        running_total += line_item.unit_price
        create_discount(running_total, line_item, 'retailer') if running_total > 500
      end
    end
  end

  def create_wholesaler_discounts
    running_total = 0
    tags = []
    sorted_line_items.each do |line_item|
      # virtually separates the line items
      (1).upto(line_item.quantity) do
        running_total += line_item.unit_price
        if running_total > 500
          create_discount(running_total, line_item, 'wholesaler')
          tags << line_item.product.tags.split(",")
        end
      end
    end
    if tags.flatten.uniq.reject(&:blank?).count >= 5
      clear_discounts
      create_retailer_discounts
    end
  end

  def create_discount(running_total, line_item, source)
    unit_price = line_item.unit_price
    _source = (running_total - unit_price) < 16_500 ? 'retailer' : source
    discount_percent = _source == 'retailer' ? 0.1 : 0.25

    if (running_total - unit_price) < 500
      discount = (unit_price - (500 - (running_total - unit_price))) * discount_percent
      line_item.line_item_discounts.create!(source: 'retailer <just above 500>', amount: discount)
    elsif source == 'wholesaler' && ((running_total - unit_price) < 16_500 && running_total > 16_500)
      wholesaler_discount = running_total - 16_500
      line_item.line_item_discounts.create!(source: 'wholesaler <just above 16,500>', amount: wholesaler_discount * 0.25)
      discount = unit_price - wholesaler_discount
      line_item.line_item_discounts.create!(source: 'retailer <just below 16,500', amount: discount * 0.1)
    else
      discount = unit_price * discount_percent
      if source == 'wholesaler' && running_total < 16_500
        _source = 'wholesaler with retailer discount <just below 16,500>'
      end
      line_item.line_item_discounts.create!(source: _source, amount: discount)
    end
  end

  def eligible_price_for_discount(running_total, unit_price)
    if (running_total - unit_price) < 500
      (unit_price - (500 - (running_total - unit_price)))
    elsif (running_total - unit_price) < 16_500 && running_total > 16_500
      ()
    else
      unit_price
    end
  end

  def sorted_line_items
    @sorted_line_items = cart.line_items.sort{ |a, b| a.product.price <=> b.product.price }
  end

end
