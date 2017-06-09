class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :images

  has_many :variants
  # default_scope { where(active: true) }
end
