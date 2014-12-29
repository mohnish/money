json.array!(@payment_sources) do |payment_source|
  json.extract! payment_source, :id, :index, :show, :create, :update, :destroy
  json.url payment_source_url(payment_source, format: :json)
end
