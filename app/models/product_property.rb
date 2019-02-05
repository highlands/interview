class ProductProperty < ApplicationRecord
  
  #attr_accessible :value, :product_id, :property_id
  
  belongs_to :product
  belongs_to :property
  
  accepts_nested_attributes_for :property, allow_destroy: true
  accepts_nested_attributes_for :product, allow_destroy: true
end