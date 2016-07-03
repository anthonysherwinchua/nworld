class Category < ActiveRecord::Base

  has_many :products, inverse_of: :category, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
