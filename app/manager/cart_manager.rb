class CartManager

  attr_reader :cart, :errors

  def initialize(cart_id)
    @cart = Cart.find(cart_id)
    @errors = []
  end

  def add_product(product_id, quantity = 1)
    product = Product.find(product_id)
    line_item = @cart.line_items.find_or_create_by(product: product)
    line_item.increment!(:quantity, quantity)
  end

  def update_line_item(params)
    id = params[:id].to_i
    quantity = params[:quantity].to_i
    errors << 'Quantity cannot be less than 1' if quantity < 1
    update_line_item_quantity(id: id, quantity: quantity)
    errors.empty?
  end

  def delete_line_item(id)
    line_item = @cart.line_items.find(id)
    unless line_item.destroy
      errors << line_item.errors
    end
    errors.blank?
  end

  def update_shipping_country(params)
    id = params[:shippable_country].to_i
    shippable_country = ShippableCountry.find_by(id: id)
    errors << @cart.errors unless @cart.update_attributes(shippable_country: shippable_country)
    errors.blank?
  end

  private

  def update_line_item_quantity(id:, quantity:)
    if errors.empty?
      line_item = @cart.line_items.find(id)
      line_item.update_attributes(quantity: quantity)
    end
  end

end
