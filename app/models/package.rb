class Package < ActiveRecord::Base

  validates :price, :worth, presence: true

  validates :price, numericality: { greater_than: 0 }
  validates :worth, numericality: { greater_than: 0 }
end
