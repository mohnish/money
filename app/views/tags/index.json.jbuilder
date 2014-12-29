json.array!(@tags) do |tag|
  json.extract! tag, :id, :index, :create, :destroy
  json.url tag_url(tag, format: :json)
end
