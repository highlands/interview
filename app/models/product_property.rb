class ProductProperty < ApplicationRecord
  
  
  
  belongs_to :product
  belongs_to :property
  
  accepts_nested_attributes_for :property, :product, allow_destroy: true
  
  #validates :property, :presence => true
  
  #delegate :name, to: :property, prefix: true
  #delegate :name=, to: :property, prefix: true
  
end