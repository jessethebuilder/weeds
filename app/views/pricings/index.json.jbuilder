json.array!(@pricings) do |pricing|
  json.extract! pricing, :id, :per_gram, :per_eighth, :per_quarter, :per_half, :per_ounce, :per_item
  json.url pricing_url(pricing, format: :json)
end
