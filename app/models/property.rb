class Property < ApplicationRecord
  
  #Validate Name uniqueness
  validates :name, uniqueness: true {message: "Attribute name is already in use"}
  
  #Validate Name length
  validates :name, length: {maximum: 255, message: "Property name must be 255 characters or less"}
  
end
