class Product < ApplicationRecord
  
  #Validate that UPC is a number
  validates :upc, numericality: { only_integer: true, message: "Must be a number"} 
  
  
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
      errors.add(:available_on, "Must be a future date")
    end
  end
  
end
