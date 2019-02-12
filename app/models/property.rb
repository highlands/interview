class Property < ApplicationRecord
  has_many :product_properties, inverse_of: :property
  has_many :products, through: :product_properties
  
  accepts_nested_attributes_for :products, :product_properties
end
