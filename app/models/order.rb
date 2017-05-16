class Order < ApplicationRecord
  extend Enumerize
  enumerize :status, in: [:progressing, :placed, :shipped, :cancelled],
    default: :progressing, predicates: true

  belongs_to :guest
  has_many :order_items

  before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  private

  def update_subtotal
    self[:sub_total] = sub_total
  end
end
