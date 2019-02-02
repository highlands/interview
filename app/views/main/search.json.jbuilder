json.items do
  json.array!(@products) do |product|
    json.name product.name
    json.upc product.upc
    json.available_on product.available_on
    
    #Get ProductProperties for this Product
    json.product_properties product.product_properties do |product_property|
    
      #ProductProperty value
      json.product_property_value product_property.value
      
      #Get the associated Property name
      json.property product_property.property.name
    end
  end
end