class ShippingCalculator

  attr_reader :cart

  def initialize(cart)
    @cart = cart
  end

  def total_price
    @total_price ||= zone ? closest_pricing(zone, total_weight) : 0
  end

  def zone
    @zone ||= cart.shippable_country&.zone
  end

  def total_weight
    @total_weight ||= LineItemsCalculator.new(cart).total_weight
  end

  private

  def closest_pricing(zone, weight)
    @closest_pricing ||= zone.zone_pricings.where('weight_min >= ?', weight).order(weight_min: :asc).first&.price.to_f
  end

end
