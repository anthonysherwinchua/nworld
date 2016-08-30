class Product < ActiveRecord::Base

  mount_uploader :directory_image, DirectoryImageUploader
  mount_uploaders :images, ImageUploader

  enum status: [:draft, :brand_new, :featured, :regular]

  belongs_to :category, inverse_of: :products

  validates :title, :price, :status, :weight, :unit, presence: true
  validates :category, presence: true
  validates :title, uniqueness: { scope: :category_id, case_sensitive: false, message: 'Duplicate record' }
  validates :weight, numericality: { greater_than: 0 }

  scope :published, -> { where(['status <> ?', Product.statuses[:draft]]) }
end
