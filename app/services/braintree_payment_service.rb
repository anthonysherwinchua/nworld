class BraintreePaymentService

  attr_accessor :cart, :nonce, :errors

  def initialize(cart_id, params)
    @cart = Cart.find cart_id
    @nonce = params["payment_method_nonce"]
  end

  def save
    amount = CartCalculator.new(@cart).total_price

    result = Braintree::Transaction.sale(
      amount: amount,
      payment_method_nonce: @nonce,
    )

    unless result.success?
      @errors = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
    end

    @errors.blank?
  end


end
