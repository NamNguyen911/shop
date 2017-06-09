class Variant < ApplicationRecord
  serialize :values, Array
  belongs_to :product
end
