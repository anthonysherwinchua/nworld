class CartCalculator

  attr_reader :cart

  def initialize(cart)
    @cart = cart
  end

  def subtotal
    @subtotal ||= cart.line_items.inject(0) do |sum, line_item|
      sum += LineItemCalculator.new(line_item).subtotal
    end
  end

  def shipping_price
    @shipping_price ||= zone ? closest_pricing(zone, total_weight) : 0
  end

  # def discount_price
  #   @discount_price ||= if cart.user.blank?
  #                         0
  #                       elsif cart.user.has_role?('wholesaler')
  #                         wholesaler_discount
  #                       elsif cart.user.has_role?('retailer')
  #                         retailer_discount
  #                       else
  #                         0
  #                       end
  # end
  #
  # def retailer_discount
  #   @retailer_discount ||= ((subtotal - 500) * 0.1).abs
  # end
  #
  # def wholesaler_discount
  #   if subtotal >= 16_0000
  #     _current_subtotal = 1_600 # 14_400
  #
  #   else
  #     retailer_discount
  #   end
  # end
  #
  # def sorted_line_items
  #   @sorted_line_items ||= cart.line_items.sort{ |a, b| a.product.price <=> b.product.price }
  # end

  def zone
    @zone ||= cart.shippable_country&.zone
  end

  def total_weight
    @total_weight ||= cart.line_items.inject(0) do |sum, line_item|
      sum += LineItemCalculator.new(line_item).total_weight
    end
  end

  def total_price
    @total_price ||= subtotal + shipping_price - discount_price
  end

  def total_price_in_cent
    @total_price_in_cent ||= (total_price * 100).round
  end

  private

  def closest_pricing(zone, weight)
    @closest_pricing ||= zone.zone_pricings.where('weight_min >= ?', weight).order(weight_min: :asc).first&.price.to_f
  end

end
