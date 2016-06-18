class Zone < ActiveRecord::Base

  has_many :shippable_countries, inverse_of: :zone
  has_many :zone_pricings, inverse_of: :zone

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
