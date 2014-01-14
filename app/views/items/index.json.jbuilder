json.array!(@items) do |item|
  json.extract! item, :id, :name, :section_id, :pricing_id, :description
  json.url item_url(item, format: :json)
end
