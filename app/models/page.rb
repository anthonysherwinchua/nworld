class Page < ActiveRecord::Base

  validates :name, :title, :content, presence: true
  validates :name, uniqueness: true

end
