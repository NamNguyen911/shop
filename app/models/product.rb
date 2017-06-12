class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :images

  has_many :variants
  # default_scope { where(active: true) }

  after_save :create_variants

  def sizes
    self.variants.where(name: "Size").first
  end

  def photo
    if images.empty?
      images.new()
    else
      images.first
    end
  end

  private

  def create_variants
    # Size
    self.variants.create(name: "Size", values: %w(S M L))
  end
end
