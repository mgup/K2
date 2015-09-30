json.array!(@orders) do |office_order|
  json.extract! office_order, :id
  json.url office_order_url(office_order, format: :json)
end
