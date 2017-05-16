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

  def available
    order_items.all? { |oi| oi.quantity <= oi.product.quantity }
  end

  private

  def update_subtotal
    self[:sub_total] = subtotal
  end
end
