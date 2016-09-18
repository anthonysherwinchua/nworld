class Cart::BillingDetailsUpdateForm < BaseForm

  attr_accessor :cart

  delegate :errors, to: :cart, prefix: false

  attr_reader :first_name, :last_name, :address, :zip_code, :city, :shippable_country

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :shippable_country, presence: true

  def initialize(cart, params = {})
    @cart = cart
    super(params)
  end

  def cart_attributes=(attributes)
    attributes[:shippable_country] = ShippableCountry.find_by(id: attributes[:shippable_country])
    cart.attributes = attributes
  end

  def save
    delegate_attributes_to_form(:cart, [:first_name, :last_name, :address, :zip_code, :city, :shippable_country])

    if valid?
      cart.save
    end
    errors.blank?
  end

end

