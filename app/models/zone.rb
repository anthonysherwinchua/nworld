class Zone < ActiveRecord::Base

  has_many :shippable_countries, inverse_of: :zone
  has_many :zone_pricings, inverse_of: :zone
  has_many :zone_range_pricings, inverse_of: :zone

  belongs_to :courier, inverse_of: :zones

  validates :name, presence: true, uniqueness: { scope: :courier_id, case_sensitive: false, message: 'Duplicate record.' }
  validates :courier, presence: true

end
