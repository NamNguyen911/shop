class Guest < ApplicationRecord
  has_one :order

  validates :name, presence: { message: "Vui lòng nhập họ tên" }
  validates :address, presence: { message: "Vui lòng nhập địa chỉ" }
  validates :phone_number, presence: { message: "Vui lòng nhập số điện thoại" }
end
