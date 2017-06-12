class Image < ApplicationRecord
  belongs_to :product

  has_attached_file :file, styles: { medium: "500x667>", thumb: "100x134>" }, default_url: "/images/:style/missing.jpg"
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/
end
