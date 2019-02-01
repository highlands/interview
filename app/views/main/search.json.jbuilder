json.items do
  json.array!(@products) do |product|
    json.name product.name
    json.upc product.upc
    json.available_on product.available_on
  end
end