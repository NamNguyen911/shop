class Order < ApplicationRecord
  extend Enumerize
  enumerize :status, in: [:processing, :placed, :shipped, :cancelled],
    default: :processing, predicates: true

  belongs_to :guest
  has_many :order_items, dependent: :destroy

  before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def available
    order_items.all? { |oi| oi.quantity <= oi.product.quantity }
  end

  def cancel
    # only cancel order which is placed? or processing?
    if self.processing?
      update(status: :cancelled)
    elsif self.placed?
      self.transaction do
        self.update(status: :cancelled)
        self.order_items.each do |oi|
          oi.product.update(quantity: oi.product.quantity - oi.quantity)
        end
      end
    end
  end

  private

  def update_subtotal
    self[:sub_total] = subtotal
  end

end
