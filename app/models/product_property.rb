class ProductProperty < ApplicationRecord
  belongs_to :product
  belongs_to :property
  
  accepts_nested_attributes_for :product, :property
  
  #Validate Value length
  validates :value, length: {maximum: 255, message: "must be 255 characters or less"}
  
  #Make properties unique
  def property_attributes=(attributes)
    self.property = Property.find_or_create_by(name: attributes[:name])
  end
  
end
