json.array!(@trackers) do |tracker|
  json.extract! tracker, :id, :title, :kind, :pool_id
  json.url tracker_url(tracker, format: :json)
end
