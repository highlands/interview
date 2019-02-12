class Product < ApplicationRecord
  has_many :product_properties, inverse_of: :product
  has_many :properties, through: :product_properties
  
  accepts_nested_attributes_for :properties, :product_properties
  
  
end
