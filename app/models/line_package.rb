class LinePackage < ActiveRecord::Base

  has_many :line_items, inverse_of: :line_package
  belongs_to :cart, inverse_of: :line_packages
  belongs_to :package

  validates :cart, presence: true
  validates :package, presence: true

end
