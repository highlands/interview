class Product < ApplicationRecord
  
  #Set references
  #attr_accessible :name, :upc, :available_on, :product_properties_attributes
  has_many :product_properties, inverse_of: :product
  accepts_nested_attributes_for :product_properties, allow_destroy: true
  
  #Validate Name uniqueness
  validates :name, uniqueness: {message: "Product name is already in use"}
  
  #Validate Name length
  validates :name, length: {maximum: 1024, message: "Product name must be 1024 characters or less"}
  
  #Validate that UPC is a number
  validates :upc, numericality: { only_integer: true, message: "UPC must be a number"} 
  
  #Validate UPC uniqueness
  validates :upc, uniqueness: {message: "UPC is already in use"}
  
  
  #Validate that UPC is 10, 12 or 13 digits long
  validate :upc_length
  
  def upc_length
    unless upc.size == 10 or upc.size == 12 or upc.size == 13
      errors.add(:upc, "UPC must be 10, 12 or 13 digits")
    end
  end
  
  #Validate that available_on is in the future
  validate :available_date
  
  def available_date
    unless available_on > Date.today
      errors.add(:available_on, "Date must be in the future")
    end
  end
  
end
