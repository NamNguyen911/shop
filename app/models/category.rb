class Category < ApplicationRecord
  has_many :products

  has_attached_file :photo, styles: { medium: "500x667>", thumb: "100x134>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
