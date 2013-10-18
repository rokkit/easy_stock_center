json.array!(@traderooms) do |traderoom|
  json.extract! traderoom, :name
  json.url traderoom_url(traderoom, format: :json)
end
