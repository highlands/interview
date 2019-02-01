class ProductProperty < ApplicationRecord
  belongs_to :product
  belongs_to :property
end
