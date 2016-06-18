class ShippableCountry < ActiveRecord::Base

  belongs_to :zone, inverse_of: :shippable_countries

  validates :name, presence: true
  validates :zone, presence: true
  validates :name, uniqueness: { scope: :zone_id, case_sensitive: false, message: 'Duplicate record.' }

end
