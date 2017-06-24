class LineItem < ActiveRecord::Base

  belongs_to :cart, inverse_of: :line_items
  belongs_to :product

  validates :cart, presence: true
  validates :product, presence: true
  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }, on: :update

end
