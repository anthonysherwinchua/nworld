class Cart < ActiveRecord::Base

  has_many :line_packages, inverse_of: :cart, dependent: :destroy
  has_many :line_items, -> { order(:id) }, inverse_of: :cart, dependent: :destroy
  belongs_to :user, inverse_of: :carts
  belongs_to :shippable_country, inverse_of: :carts

  validates :shippable_country, presence: true, on: :update

  def total_items
    line_items.sum(:quantity)
  end
end
