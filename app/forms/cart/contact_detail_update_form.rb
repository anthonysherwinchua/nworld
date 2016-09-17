class Cart::ContactDetailUpdateForm < BaseForm

  attr_accessor :cart

  delegate :errors, to: :cart, prefix: false

  attr_reader :contact_number

  validates :contact_number, presence: true

  def initialize(cart, params = {})
    @cart = cart
    super(params)
  end

  def cart_attributes=(attributes)
    cart.attributes = attributes
  end

  def save
    delegate_attributes_to_form(:cart, [:contact_number])

    if valid?
      cart.save
    end
    errors.blank?
  end
end
