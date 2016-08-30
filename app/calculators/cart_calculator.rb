class CartCalculator

  attr_reader :cart

  def initialize(cart)
    @cart = cart
  end

  def subtotal
    cart.line_items.inject(0) do |sum, line_item|
      sum += LineItemCalculator.new(line_item).subtotal
    end
  end

  def shipping_price
    zone = cart.shippable_country&.zone
    return 0 unless zone
    weight = total_weight
    closest_pricing(zone, weight)
  end

  def total_weight
    cart.line_items.inject(0) do |sum, line_item|
      sum += LineItemCalculator.new(line_item).total_weight
    end
  end

  def total_price
    subtotal + shipping_price
  end

  private

  def closest_pricing(zone, weight)
    pricing = zone.zone_pricings.where('weight >= ? and weight < ?', weight, (weight + 0.5)).order('weight asc').first
    pricing = closest_range_pricing(zone) unless pricing
    pricing.price
  end

  def closest_range_pricing(zone)
    # assuming there is only one zone range pricing per zone
    zone.zone_range_pricings.last
  end

end
