class Property < ApplicationRecord
  
  #Set references
  has_many :product_properties
  
  #Validate Name uniqueness
  validates :name, uniqueness: {message: "Attribute name is already in use"}
  
  #Validate Name length
  validates :name, length: {maximum: 255, message: "Property name must be 255 characters or less"}
  
end
