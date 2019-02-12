class ProductProperty < ApplicationRecord
  belongs_to :product, optional: :true
  belongs_to :property, optional: :true
  
  accepts_nested_attributes_for :product, :property
  
  #Make properties unique
  def property_attributes=(attributes)
    self.property = Property.find_or_create_by(name: attributes[:name])
  end
  
end
