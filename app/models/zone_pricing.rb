class ZonePricing < ActiveRecord::Base

  serialize :weight_range

  belongs_to :zone, inverse_of: :zone_pricings

  validates :weight_min, :weight_max, :price, presence: true
  validates :zone, presence: true
  validates :price, inclusion: { in: 0.5..20_000.0 }

  validates :weight_min, numericality: { greater_than: 0 }, uniqueness: { scope: :zone_id, message: 'Duplicate record.' }
  validates :weight_max, numericality: { greater_than: 0 }

end
