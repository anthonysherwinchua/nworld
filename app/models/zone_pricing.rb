class ZonePricing < ActiveRecord::Base

  belongs_to :zone, inverse_of: :zone_pricings

  validates :weight, :price, presence: true
  validates :zone, presence: true
  validates :weight, uniqueness: { scope: :zone_id, case_sensitive: false, message: 'Duplicate record.' }
  validates :weight, numericality: { greater_than: 0 }
  validates :price, inclusion: { in: 0.5..20_000.0 }

end
