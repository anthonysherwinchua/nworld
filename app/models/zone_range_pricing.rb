class ZoneRangePricing < ActiveRecord::Base
  serialize :weight_range

  belongs_to :zone, inverse_of: :zone_range_pricings

  validates :weight_range, :price, presence: true
  validates :zone, presence: true

end
