class Order < ApplicationRecord
  extend Enumerize
  enumerize :status, in: [:progressing, :placed, :shipped, :cancelled],
    default: :progressing, predicates: true

  # should have many products, a function to calculate the total field
  has_many :order_items
end
