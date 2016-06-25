class Courier < ActiveRecord::Base

  has_many :zones, inverse_of: :courier

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
