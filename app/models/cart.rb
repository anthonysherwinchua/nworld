class Cart < ActiveRecord::Base

  has_many :line_packages, inverse_of: :cart, dependent: :destroy
  has_many :line_items, -> { order(:id) }, inverse_of: :cart, dependent: :destroy
  belongs_to :user, inverse_of: :carts
  belongs_to :shippable_country, inverse_of: :carts

  before_validation :generate_hashed_id

  enum status: [:open, :paid]

  def total_items
    @total_items ||= line_items.sum(:quantity)
  end

  private

  def generate_hashed_id
    self.hashed_id ||= SecureRandom.hex(32)
  end

end
