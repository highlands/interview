class Product < ApplicationRecord
  has_many :product_properties, inverse_of: :product
  has_many :properties, through: :product_properties
  
  accepts_nested_attributes_for :properties, :product_properties
  
  #Validate Name uniqueness
  validates :name, uniqueness: {message: "already in use"}
  
  #Validate Name length
  validates :name, length: {maximum: 1024, message: "must be 1024 characters or less"}
  
  #Validate that UPC is a number
  validates :upc, numericality: { only_integer: true, message: "must be a number"} 
  
  #Validate UPC uniqueness
  validates :upc, uniqueness: {message: "already in use"}
  
  
  #Validate that UPC is 10, 12 or 13 digits long
  validate :upc_length
  
  def upc_length
    unless upc.size == 10 or upc.size == 12 or upc.size == 13
      errors.add(:upc, "must be 10, 12 or 13 digits")
    end
  end
  
  #Validate that available_on is in the future
  validate :available_date
  
  def available_date
    unless available_on > Date.today
      errors.add(:available_on, "must be in the future")
    end
  end
end
