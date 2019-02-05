class Property < ApplicationRecord
  
  #Set references
  #attr_accessible :name, :product_properties_attributes
  has_many :product_properties, inverse_of: :property
  accepts_nested_attributes_for :product_properties, allow_destroy: true
  
  #Validate Name uniqueness
  validates :name, uniqueness: {message: "Attribute name is already in use"}
  
  #Validate Name length
  validates :name, length: {maximum: 255, message: "Property name must be 255 characters or less"}
  
end
