class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :images

  # default_scope { where(active: true) }
end
