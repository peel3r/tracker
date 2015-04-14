json.array!(@pools) do |pool|
  json.extract! pool, :id, :title
  json.url pool_url(pool, format: :json)
end
