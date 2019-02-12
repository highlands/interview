class Property < ApplicationRecord
  has_many :product_properties, inverse_of: :property
  has_many :products, through: :product_properties
  
  accepts_nested_attributes_for :products, :product_properties
  
  #Validate Name uniqueness
  validates :name, uniqueness: {message: "already in use"}
  
  #Validate Name length
  validates :name, length: {maximum: 255, message: "must be 255 characters or less"}
end
