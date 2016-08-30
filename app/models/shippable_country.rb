class ShippableCountry < ActiveRecord::Base

  has_many :carts, inverse_of: :shippable_country
  belongs_to :zone, inverse_of: :shippable_countries

  validates :name, presence: true
  validates :zone, presence: true
  validates :name, uniqueness: { scope: :zone_id, case_sensitive: false, message: 'Duplicate record.' }

end
